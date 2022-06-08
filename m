Return-Path: <virtio-comment-return-3109-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 939EA986407
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Jun 2022 12:40:09 +0000 (UTC)
References: <877d61wuc0.fsf@linaro.org>
 <819567d71d72495b6ab71eda915dcfdb8470467b.camel@intel.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed, 08 Jun 2022 13:38:03 +0100
In-reply-to: <819567d71d72495b6ab71eda915dcfdb8470467b.camel@intel.com>
Message-ID: <87r13ztjkq.fsf@linaro.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Next VirtIO device for Project Stratos?
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: "Bradford, Robert" <robert.bradford@intel.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


"Bradford, Robert" <robert.bradford@intel.com> writes:

> On Tue, 2022-05-31 at 09:07 +0100, Alex Benn=C3=A9e wrote:
>> Watchdog / 35
>> -------------
>>=20
>> Discussion about this is usually conflated with reset functionality
>> as
>> the two are intimately related.
>>=20
>> An early interest in this was for providing a well specified reset
>> functionality firmware running on the -M virt machine model in QEMU.
>> The
>> need has been reduced somewhat with the provision of the sbsa-ref
>> model
>> which does have a defined reset pin.
>>=20
>> Other questions that would need to be answered include how the
>> functionality would interact with the hypervisor given a vCPU could
>> easily not be scheduled by it and therefore miss its kick window.
>>=20
>
> I guess this a risk with any use of a watchdog whether it be emulating
> a physical device or a paravirtualised one. In practice we have never
> seen this.
>
>> Currently there have been no proposals for the spec or
>> implementations.
>
> I was the one who requested the ID be reserved. We have an
> implementation in Cloud Hypervisor:
> https://github.com/cloud-hypervisor/cloud-hypervisor/blob/main/virtio-dev=
ices/src/watchdog.rs
>

Ahh good. I guess it could be another cloud hypervisor component that
makes the transition to rust-vmm if there is interest?

> As well as the kernel side:=20
>
> https://github.com/cloud-hypervisor/linux/commit/cc8f7579faad79cdf02f9b6a=
742510cd1b1cf340
>
> I admit writing up a patch for the specification fell through the
> cracks. That's something I will try to rectify in the near future as it
> would also be nice to be able to upstream the kernel patch.

Thanks, please feel free to Cc me on any such patches and we can take a
look.

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

