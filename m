Return-Path: <virtio-comment-return-2942-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E3D1D98653B
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Apr 2022 18:13:40 +0000 (UTC)
Message-ID: <d5c269f2-d5e0-ec9a-5737-874c8c101368@opensynergy.com>
Date: Wed, 13 Apr 2022 20:13:33 +0200
References: <20220412083059.86367-1-cohuck@redhat.com>
From: Harald Mommer <hmo@opensynergy.com>
In-Reply-To: <20220412083059.86367-1-cohuck@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] iommu: offered -> negotiated
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hello,

I consider those changes not as clarifications but as requirements=20
changes which will cause software to be changed.

On 12.04.22 10:30, Cornelia Huck wrote:
> All those clauses actually apply whenever the feature is negotiated,
> not merely offered. Rename to clarify things.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   virtio-iommu.tex | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/virtio-iommu.tex b/virtio-iommu.tex
> index f8cbe8895f0d..efe1000ac2d2 100644
> --- a/virtio-iommu.tex
> +++ b/virtio-iommu.tex
> @@ -232,22 +232,22 @@ \subsection{Device operations}\label{sec:Device Typ=
es / IOMMU Device / Device op
>     Creating mappings aligned on large page sizes can improve performance
>     since they require fewer page table and TLB entries.
>  =20
> -\item If the VIRTIO_IOMMU_F_DOMAIN_RANGE feature is offered,
> +\item If the VIRTIO_IOMMU_F_DOMAIN_RANGE feature is negotiated,
>     \field{domain_range} describes the values supported in a \field{domai=
n}
> -  field. If the feature is not offered, any \field{domain} value is vali=
d.
> +  field. If the feature is not negotiated, any \field{domain} value is v=
alid.
>  =20
> -\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is offered,
> +\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is negotiated,
>     \field{input_range} contains the virtual address range that the IOMMU=
 is
>     able to translate. Any mapping request to virtual addresses outside o=
f
>     this range fails.
>  =20
> -  If the feature is not offered, virtual mappings span over the whole
> +  If the feature is not negotiated, virtual mappings span over the whole
>     64-bit address space (\texttt{start =3D 0, end =3D 0xffffffff fffffff=
f})
>   \end{itemize}

Assume the following situation: Due to internal implementation there is=20
a device which can only work when the domain range from the driver is in=20
a certain value range (internal implementation: Array of N domains=20
indexed from 0 to N-1). And then there is a driver which behaves in a=20
compliant manner but has no idea about the feature=20
VIRTIO_IOMMU_F_DOMAIN_RANGE so does not negotiate it. With "negotiated"=20
the driver the device has to fail feature negotiation as it cannot=20
accept all possible domain values during live operation. With "offered"=20
it can succeed feature negotiation as it reserves the right to fail=20
later in the ATTACH/DETACH/MAP/UNMAP REQUEST with error=20
VIRTIO_IOMMU_S_RANGE when a domain value is received it cannot handle=20
internally.

Exactly the same applies for VIRTIO_IOMMU_F_INPUT_RANGE.

The implementation I'm doing currently cannot work with all possible=20
virtual address value ranges due to efficiency reasons. With the changed=20
text the implementation should also be changed now to fail feature=20
negotiation if the driver does not offer VIRTIO_IOMMU_F_INPUT_RANGE. As=20
the implementation can currently handle all possible domain values (not=20
in the future for efficiency reasons when the implementation is getting=20
optimized) I can now think about failing the feature negotiation if=20
VIRTIO_IOMMU_F_DOMAIN_RANGE was not negotiated or to remove the checks=20
for the allowed value range already implemented.

No big issue (for me). But causes a change in the implementation and may=20
therefore not be an editorial change only. The original wording may not=20
have been a mistake from the author. It may have been there for an=20
(unknown) purpose. Some old driver known to behave compliant to the=20
device implementation but having no idea about those features?

Regards
Harald

--=20
Dipl.-Ing. Harald Mommer
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone:  +49 (30) 60 98 540-0 <=3D=3D Zentrale
Fax:    +49 (30) 60 98 540-99
E-Mail: harald.mommer@opensynergy.com

www.opensynergy.com

Handelsregister: Amtsgericht Charlottenburg, HRB 108616B
Gesch=C3=A4ftsf=C3=BChrer/Managing Director: Regis Adjamah


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

