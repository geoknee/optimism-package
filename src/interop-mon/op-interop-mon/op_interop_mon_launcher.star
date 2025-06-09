"""
Support for the op-interop-mon service.
"""


def launch(
    plan,
    image,
    l2_rpcs,
):
    """Launch the op-interop-mon service.

    Args:
        plan: The plan to add the service to.
        image (str): The image to use for the op-interop-mon service.
        l2_rpcs (str): Comma-separated list of L2 RPC endpoints to monitor.
    """
    config = ServiceConfig(
        image=image,
        env_vars={
            "OP_INTEROP_MON_METRICS_ENABLED": "true",
            "OP_INTEROP_MON_L2_RPCS": l2_rpcs,
        },
        ports={
            "metrics": PortSpec(
                number=7300,
                transport_protocol="TCP",
                application_protocol="http",
            ),
        },
    )
    plan.add_service("interop-mon", config)
