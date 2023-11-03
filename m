Return-Path: <virtio-comment-return-8143-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F01C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3E6D42A8FE
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F430986C38
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:50:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 088B0986C2F; Fri,  3 Nov 2023 10:50:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02F5D986C30
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 10:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rSANdhFQPzyoGhkTKHInHA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699008629; x=1699613429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCNBeLO2Yk8tw5MO2i+BDfBOcAqZHmnGcZ1KIdAg0L0=;
        b=ErUOdAemKaNKbbpIV2JQ7+elDnd+uKqCxKzXO96j6eZqRXldOKSfu5OT+zKLtDH6Hx
         CP+0sg+ISOQZ9PfehepSTpUnfoagn39cvFatnvK0HtVP8CKVN1jZf2QA97JrhWWuVes+
         QkpFNzjQ1IzlDZ7r7s9r5MGkJ1nxyL9wFAE4X3BqAIAVfmf6DyKbvdinAfypc09aGmgB
         VsG4krpK1WXaelYBXvHzE5pfzrfEQMf8iJ0PqqsJimq1AM5fqD0Y61gzwEn+/MNX6uZZ
         DNjqesFe74q3TOBE9v7YgZngeI4w0lbWA0BHwwuPYZPcuo30nYVMWCfleUXNs9krTFdc
         OPJQ==
X-Gm-Message-State: AOJu0YzyZvQngp1jT1Ju3sBwtrdQKs0rrABfpHg8Zeqy0evxHpSEvnw+
	qZW0kjrx/tvb5JULQLkhcinyzhB3pgqhtXBFjBsVcaYySO75FyxYdI0xb5w5l9TOQb849peCz2K
	m9UaII7EDeDgHkxgvCad5FTy4F0sLHv2wXg==
X-Received: by 2002:a2e:b4bc:0:b0:2c5:fb9:49b6 with SMTP id q28-20020a2eb4bc000000b002c50fb949b6mr14448121ljm.10.1699008629326;
        Fri, 03 Nov 2023 03:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFiOj2cXzTgUZ2W/iVxOogkwEBMKgDVclEEi7fBYt2U7r4RzX/b1Xvb+sgRZc69VaEkFamLA==
X-Received: by 2002:a2e:b4bc:0:b0:2c5:fb9:49b6 with SMTP id q28-20020a2eb4bc000000b002c50fb949b6mr14448105ljm.10.1699008628934;
        Fri, 03 Nov 2023 03:50:28 -0700 (PDT)
Date: Fri, 3 Nov 2023 06:50:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231103064730-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231103103437.72784-7-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
> +\item[\field{bitmap_addr}]
> +	The driver use this to set the address of the bitmap which records the dirty pages
> +	caused by the device.
> +	Each bit in the bitmap represents one memory page, bit 0 in the bitmap
> +	reprsents page 0 at address 0, bit 1 represents page 1, and so on in a linear manner.
> +	When \field{enable} is set to 1 and the device writes to a memory page,
> +	the device MUST set the corresponding bit to 1 which indicating the page is dirty.
> +\item[\field{bitmap_length}]
> +	The driver use this to set the length in bytes of the bitmap.
> +\end{description}
> +
> +\devicenormative{\subsubsection}{Memory Dirty Pages Tracker Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory Dirty Pages Tracker Capability}
> +
> +The device MUST NOT set any bits beyond bitmap_length when reporting dirty pages.
> +
> +To prevent a read-modify-write procedure, if a memory page is dirty,
> +optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1.
> +
> +The device MAY increase \field{gra_power} to reduce \field{bitmap_length}.
> +
> +The device must ignore any writes to \field{pasid} if PASID Extended Capability is absent or
> +the PASID functionality is disabled in PASID Extended Capability


I have to say this is going to work very badly when the number of dirty
pages is small: you will end up scanning and re-scanning all of bitmap.
And the resolution is apparently 8 pages? You have just multiplied
the migration bandwidth by a factor of 8.

-- 
MST


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

