Return-Path: <virtio-comment-return-2303-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF4619862CE
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Oct 2021 11:03:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210815160140.22749-1-mgurtovoy@nvidia.com>
References: <20210815160140.22749-1-mgurtovoy@nvidia.com>
Date: Mon, 04 Oct 2021 13:03:13 +0200
Message-ID: <87h7dx2gsu.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH 1/1] Fix copy/paste bug in PCI
 transport paragraph
Content-Type: text/plain
To: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com
Cc: stefanha@redhat.com, eperezma@redhat.com, oren@nvidia.com, jasowang@redhat.com, aadam@redhat.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Aug 15 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> Refer to "Shared memory capability" and not to "Device-specific
> configuration".
>
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>  content.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index 1bfce9f..60b6072 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -1144,7 +1144,7 @@ \subsubsection{Shared memory capability}\label{sec:Virtio Transport Options / Vi
>  The identifier in \field{cap.id} does not denote a certain order of
>  preference; it is only used to uniquely identify a region.
>  
> -\devicenormative{\paragraph}{Device-specific configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
> +\devicenormative{\paragraph}{Shared memory capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
>  
>  The region defined by the combination of \field{cap.offset},
>  \field{offset_hi}, and \field {cap.length}, \field{length_hi}
> @@ -1152,7 +1152,7 @@ \subsubsection{Shared memory capability}\label{sec:Virtio Transport Options / Vi
>  
>  The \field{cap.id} MUST be unique for any one device instance.
>  
> -\devicenormative{\paragraph}{Device-specific configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
> +\devicenormative{\paragraph}{Shared memory capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Shared memory capability}
>  
>  The region defined by the combination of the \field {cap.offset},
>  \field {cap.offset_hi}, and \field {cap.length}, \field

Thanks, pushed as an editorial update.


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

