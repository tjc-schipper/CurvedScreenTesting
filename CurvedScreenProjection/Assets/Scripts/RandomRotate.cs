using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomRotate : MonoBehaviour
{

	[SerializeField]
	float duration = 1f;

	[SerializeField]
	float rotationSpeed = 45f;

	const int NUM_ROTATIONS = 3;

	Vector3[] velocities;

	float timer = 0f;

	void Start()
	{
		velocities = new Vector3[2];
		velocities[0] = Vector3.zero;
		velocities[1] = GetRandomVelocity();
	}

	void Update()
	{
		this.timer += Time.deltaTime;
		if (this.timer >= this.duration)
			PrepareForNextLerp();

		float p = Mathf.Clamp01(timer / duration);
		this.transform.Rotate(GetInterpolatedVelocity(p) * rotationSpeed * Time.deltaTime);
	}

	void PrepareForNextLerp()
	{
		this.velocities[0] = velocities[1];
		this.velocities[1] = GetRandomVelocity();
		this.timer -= this.duration;
	}

	Vector3 GetRandomVelocity()
	{
		return Random.onUnitSphere;
	}

	Vector3 GetInterpolatedVelocity(float p)
	{
		return Vector3.Lerp(velocities[0], velocities[1], p);
	}
}
