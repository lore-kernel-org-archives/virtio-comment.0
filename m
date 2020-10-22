Return-Path: virtio-comment-return-1465-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90635986139
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Oct 2020 15:09:57 +0000 (UTC)
References: <20201021135847.15236-1-robert.bradford@intel.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
In-reply-to: <20201021135847.15236-1-robert.bradford@intel.com>
Date: Thu, 22 Oct 2020 16:09:53 +0100
Message-ID: <874kmmuwji.fsf@linaro.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] content: Reserve virtio-watchog device ID
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Rob Bradford <robert.bradford@intel.com>
Cc: virtio-comment@lists.oasis-open.org, Stratos-dev <stratos-dev@op-lists.linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>


Rob Bradford <robert.bradford@intel.com> writes:

> Reserve an ID for a watchdog device which may be used to ensure that the
> guest is responsive. This is equivalent of a hardware watchdog device
> and will trigger the reboot of the guest if the the host does not
> periodic ping from the the guest.

Out of interest is your watchdog device also going to allow for straight
power/reset control?

The use case I'm thinking of is QEMU's -m virt machine which is a purely
virtual machine which is a target for a number of firmware/bootcode
projects. QEMU provides a firmware emulation that will do the right
thing if you issue PSCI supervisor calls and you have directly loaded a
kernel. However if you are testing firmware - for example EDK2 or Arm
Trusted Firmware it is expected to make the final hw appropriate twiddle
to reboot the machine and of course that is undefined for -m virt.

> Signed-off-by: Rob Bradford <robert.bradford@intel.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

