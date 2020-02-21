Return-Path: virtio-comment-return-1090-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 177AA985F69
	for <virtio-comment@lists.oasis-open.org>; Fri, 21 Feb 2020 10:53:18 +0000 (UTC)
References: <20200220193715.12097-1-peter.hilber@opensynergy.com>
From: Peter Hilber <peter.hilber@opensynergy.com>
Message-ID: <66ca6765-4ed8-cb4a-fe20-ab5ace8f9d10@opensynergy.com>
Date: Fri, 21 Feb 2020 11:53:09 +0100
MIME-Version: 1.0
In-Reply-To: <20200220193715.12097-1-peter.hilber@opensynergy.com>
Content-Language: en-US
Subject: [virtio-comment] Re: [PATCH] Add virtio SCMI device specification
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: linux-arm-kernel@lists.infradead.org, Souvik.Chakravarty@arm.com, sudeep.holla@arm.com
List-ID: <virtio-comment.lists.oasis-open.org>

On 20.02.20 20:37, Peter Hilber wrote:
> This patch proposes a new virtio device for the Arm SCMI protocol.
>=20
> The device provides a simple transport for the Arm SCMI protocol[1]. The
> *S*ystem *C*ontroller *M*anagement *I*nterface protocol allows speaking
> to embedded system controllers that allow orchestrating things like
> power management, system state management and sensor access. The SCMI
> protocol is used on SoCs where multiple cores and co-processors need
> access to these resources.
>=20
> The virtio transport allows making use of this protocol in virtualized
> embedded systems.
>=20
> OpenSynergy has a prototype implementation, and plans to upstream the
> Linux kernel driver.
>=20
> The PDF output (with ugly fonts, apologies) is available at [2].
>=20
> [1] https://developer.arm.com/docs/den0056/b
> [2] https://share.mailbox.org/ajax/share/0d959c190d5a1c47d18eb2fd5a1c40ad=
81e8d7897ab9ca1e/1/8/Mjk/MjkvOA

For completeness: Our prototype implementation does not yet
provide the VIRTIO_SCMI_F_P2A_CHANNELS and VIRTIO_SCMI_F_SHARED_MEMORY
features.

Any feedback would be greatly appreciated.

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

