Return-Path: <virtio-comment-return-8019-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D6DC4332F
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:29:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 382382AEF1
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:29:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01C1398668D
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:29:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D4D60986662; Sun, 29 Oct 2023 14:29:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C754398667C
	for <virtio-comment@lists.oasis-open.org>; Sun, 29 Oct 2023 14:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: o3uTtLk0MmKUYn0z2UhI2g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698589747; x=1699194547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzmLuQKoazzURXyr07/kSVX364Y0SMObhwjI8Y573Nw=;
        b=VWy4B0GW6B43Vs4Ey+3BvTU9qdxqKko54vZmi0GgZ1bYzm4DEhRxkXa+UFJhQdZvwv
         UHNGtDSRcWZGhCUTFV29RdpKTSYs03gXq2UA5kYuIOZsWbIKVNyUw6ZdXki6zDziL9j7
         IN44dygrY4vrA69q7JF7OL64w/V7yhOh73SWtNklPOyMVrbEUGDwSTzEeBG48+xjwz7M
         +0gassUCcBR1HMZGHQwOcMgpIyJvq7vgMqVQae0LEqHacvLJp27TVJPojT3DnOHRPlc9
         TG2p34b0ppm4GAU07JYs0PL+78DuxelYGCPrXdUXQixAks3nf6ZR3l/2EcCwJsqGqKIg
         hlsQ==
X-Gm-Message-State: AOJu0YyHMar9APpvFpvn43RHAY+PHpYr+9yBrf9YBhc4hBmykYd1jl8Z
	yXxQT7RIHzqDfYFkzZAvl5y0BSufoLopZX0qvR1gUygh9279rh+4YDbK6c5d/AqdZTIaWF6XdUU
	CNMyZahV9MeZ3QglpEro/hJDaG4DT9MhNfA==
X-Received: by 2002:a17:907:da9:b0:9be:2991:81f9 with SMTP id go41-20020a1709070da900b009be299181f9mr7354297ejc.1.1698589747345;
        Sun, 29 Oct 2023 07:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTkvFRMYD7GwjUFBwf7m5QdGaj9dEEFfWDjzL7nsdyJCZac+ZQF5EFLw6rieFfBPQ2+fExiw==
X-Received: by 2002:a17:907:da9:b0:9be:2991:81f9 with SMTP id go41-20020a1709070da900b009be299181f9mr7354273ejc.1.1698589746753;
        Sun, 29 Oct 2023 07:29:06 -0700 (PDT)
Date: Sun, 29 Oct 2023 10:28:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	shahafs@nvidia.com
Message-ID: <20231029102837-mutt-send-email-mst@kernel.org>
References: <20231029140437.1379386-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231029140437.1379386-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] packed-ring: Change host,guest to device,driver

On Sun, Oct 29, 2023 at 04:04:37PM +0200, Parav Pandit wrote:
> Rest of the packed ring description already uses the device
> and driver terminology. Change the introductory line as well from
> host and guest to device and driver respectively.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Editorial change, right Cornelia?

> ---
>  packed-ring.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/packed-ring.tex b/packed-ring.tex
> index 9eeb382..2bb66de 100644
> --- a/packed-ring.tex
> +++ b/packed-ring.tex
> @@ -2,7 +2,7 @@ \section{Packed Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Pack
>  
>  Packed virtqueues is an alternative compact virtqueue layout using
>  read-write memory, that is memory that is both read and written
> -by both host and guest.
> +by both the device and the driver.
>  
>  Use of packed virtqueues is negotiated by the VIRTIO_F_RING_PACKED
>  feature bit.
> -- 
> 2.34.1


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

