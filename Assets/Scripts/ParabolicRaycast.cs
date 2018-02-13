using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class ParabolicRaycast {
    public static int maxNumberOfSegments = 100;

    public static bool Cast(Vector3 origin, Vector3 direction, out RaycastHit hit, GameObject line = null, float speed = 20, float gravityEffect = -9.8f)
    {
        hit = new RaycastHit();
        bool hitSomething = false;
        float lengthPerSegment = 2f / speed;
        int numberOfSegments = 0;
        Vector3 position = origin;
        Vector3 velocity = direction.normalized * speed;
        int layerMask = 1 + (1 << 8); //hit Default and Terrain layers

        LineRenderer lr = null;
        List<Vector3> vertexList = new List<Vector3>();
        if (line)
        {
            line.transform.position = origin;
            lr = line.GetComponent<LineRenderer>() ? line.GetComponent<LineRenderer>() : line.AddComponent<LineRenderer>();
            vertexList.Add(origin);
        }

        while (!hitSomething && numberOfSegments < maxNumberOfSegments)
        {
            numberOfSegments++;

            hitSomething = Physics.Raycast(position, velocity, out hit, velocity.magnitude * lengthPerSegment, layerMask);

            //Draw the line in-game
            if (lr)
            {
                //Debug.DrawRay(position, velocity * lengthPerSegment, Color.yellow, .1f, true);
                if (hitSomething)
                {
                    vertexList.Add(hit.point);
                }
                else
                {
                    vertexList.Add(position + (velocity * lengthPerSegment));
                }
            }

            //update parameters
            if (hit.collider) hitSomething = true;
            else
            {
                position = position + (velocity * lengthPerSegment);
                velocity = velocity + (Vector3.up * gravityEffect * lengthPerSegment);
            }
        }

        if (lr)
        {
            lr.positionCount =
                vertexList.Count;
            for (var i = 0; i < vertexList.Count; i++)
            {
                lr.SetPosition(i, vertexList[i]);
            }
        }

        return hitSomething;
    }


	
}
