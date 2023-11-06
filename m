Return-Path: <virtio-comment-return-8199-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB6C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:50:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 583D22CAE3
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:50:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 337FB986727
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:50:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B641986712; Mon,  6 Nov 2023 09:50:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B14F2986717
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 09:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: PhHxPaG8NSa9kQgQDLegVg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699264167; x=1699868967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFGzBNkQQcvXY3uBFFHdb6dvIF8p4XbK2Z3lULnGsiI=;
        b=syVCu49e+84j8EypkAPJT4MZIEeQt0sWvULaCCO82phDXBBQwsqniqn6ByPa2sP6oQ
         /vJfwyNgJDIw4MWlrXOkER0zmwI/VTbDYSyAY4CY8KteESQj+aUIb8Zo2Hfdct+2FXqz
         k20lcQCauTRXZUWY70ohgN7i2JlgdeCjqYyumIb/zCYFjTVyAY24F0NHUE0n0TruAcXJ
         Dyt0gVQ+Hh9aBaMzs9CLHV6ulJv7xW52BjLFIwpMPBc6tZrJhgdO07F4fgr0m+BUqqcX
         G0NKQRArHUD+fOtAWg90ODFe4iKy/d+4G4BoeF/iWN9OM1nBsTUx1VqNcWWtbz5mwQBH
         7Sbg==
X-Gm-Message-State: AOJu0Yx0pwX3MlXx1fkqrFdQxm8BvEdenALscxq5i6WYujgCR3XPr8PW
	1i+SEIsjEfC4p+DJgD2pZ7bCJZ5JOCs+WpLLR8xy7g88cJPFAo5GAWDOnFhJSTKIBz7sHm1XytB
	/OYDEaM2SO3BEyo6LSZeIXcti6tI/fl/oYQ==
X-Received: by 2002:ac2:5216:0:b0:505:79f2:5c6c with SMTP id a22-20020ac25216000000b0050579f25c6cmr19293435lfl.6.1699264166979;
        Mon, 06 Nov 2023 01:49:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEM0nhICbLchEDjCIIwufzh+a1XuNopAWf8F5B71kIo0BzAXhYcKjE1vkA7GjuEXfhrXMc21g==
X-Received: by 2002:ac2:5216:0:b0:505:79f2:5c6c with SMTP id a22-20020ac25216000000b0050579f25c6cmr19293422lfl.6.1699264166580;
        Mon, 06 Nov 2023 01:49:26 -0800 (PST)
Date: Mon, 6 Nov 2023 04:49:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231106044836-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231103103437.72784-4-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
> When SUSPEND is set, device states and virtqueue states
> should be stablized, therefore the driver should not
> reset vqs when SUSPEND is set in device status.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  content.tex | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index bcc9d4b..060b5c2 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -444,6 +444,9 @@ \subsubsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device /
>  The device MUST reset any state of a virtqueue to the default state,
>  including the available state and the used state.
>  
> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in \field{device status},
> +the driver SHOULD NOT reset any virtqueues.
> +
>  \drivernormative{\paragraph}{Virtqueue Reset}{Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>  
>  After the driver tells the device to reset a queue, the driver MUST verify that

Seems somewhat arbitrary and breaks the claim that the
feature is orthogonal and can have uses besides migration.



> -- 
> 2.35.3


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

