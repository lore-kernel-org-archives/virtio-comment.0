Return-Path: virtio-comment-return-1641-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24FEA986502
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Jan 2021 03:52:03 +0000 (UTC)
References: <20210114115844.373512-1-cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3bf0468d-143c-16a3-1592-b92a041e7227@redhat.com>
Date: Fri, 15 Jan 2021 11:51:55 +0800
MIME-Version: 1.0
In-Reply-To: <20210114115844.373512-1-cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH RFC] clarify device reset
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/1/14 =E4=B8=8B=E5=8D=887:58, Cornelia Huck wrote:
> Properly specify that the method for the driver to request a
> device reset is transport specific, and some action the device
> has to take.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   conformance.tex | 1 +
>   content.tex     | 8 ++++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/conformance.tex b/conformance.tex
> index eb3324053080..baf4574e411f 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -279,6 +279,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqu=
eues / The Virtqueue Used Ring}
>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqu=
eues / Available Buffer Notification Suppression}
>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared=
 Memory Regions}
> +\item \ref{devicenormative:General Initialization And Device Operation /=
 Device Cleanup}


I wonder whether it's better to move this to "Basic Facilities of a=20
Virtio Device"?

Thanks


>   \item \ref{devicenormative:Reserved Feature Bits}
>   \end{itemize}
>  =20
> diff --git a/content.tex b/content.tex
> index 620c0e28c9a7..126b46996be8 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -501,6 +501,8 @@ \section{Device Cleanup}\label{sec:General Initializa=
tion And Device Operation /
>   virtqueue of the device are considered live.  None of the virtqueues
>   of a device are live once the device has been reset.
>  =20
> +A driver can initiate a device reset by a transport-specific mechanism.
> +
>   \drivernormative{\subsection}{Device Cleanup}{General Initialization An=
d Device Operation / Device Cleanup}
>  =20
>   A driver MUST NOT alter virtqueue entries for exposed buffers,
> @@ -510,6 +512,12 @@ \section{Device Cleanup}\label{sec:General Initializ=
ation And Device Operation /
>  =20
>   Thus a driver MUST ensure a virtqueue isn't live (by device reset) befo=
re removing exposed buffers.
>  =20
> +\devicenormative{\subsection}{Device Cleanup}{General Initialization And=
 Device Operation / Device Cleanup}
> +
> +A device MUST reinitialize device status to 0 after receiving a reset.
> +
> +A device MUST NOT send notifications after receiving a reset.
> +
>   \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  =20
>   Virtio can use various different buses, thus the standard is split


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

