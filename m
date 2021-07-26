Return-Path: <david@redhat.com>
Subject: Re: [virtio-comment] [PATCH] Reserved feature bits: fix missing verb
References: <20210726105302.1404894-1-cohuck@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <798963aa-ce63-d317-4403-9be23e299e38@redhat.com>
Date: Mon, 26 Jul 2021 12:54:50 +0200
MIME-Version: 1.0
In-Reply-To: <20210726105302.1404894-1-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Cornelia Huck <cohuck@redhat.com>, virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 26.07.21 12:53, Cornelia Huck wrote:
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Will push as editorial update.
> 
> ---
>   content.tex | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/content.tex b/content.tex
> index 5c70a3c415a3..ceb25628010d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -6586,7 +6586,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>   
>   \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>   
> -Currently these device-independent feature bits defined:
> +Currently these device-independent feature bits are defined:
>   
>   \begin{description}
>     \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

