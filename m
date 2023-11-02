Return-Path: <virtio-comment-return-8129-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37D4C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:21:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 531CB2AC6D
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:21:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 360AE986C0B
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:21:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1DE2D986C02; Thu,  2 Nov 2023 14:21:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EFAE986C03
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 14:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fTUfx_p1PMuuuHC4xtsNwA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698934909; x=1699539709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caE8guXZl6yLCLhU5UYTGtMitsPkIq6lvND8VXs4C7A=;
        b=vPOp/21WDa2OaQenRxr41cTXGG4qEFgFSgNeTaH0c903QA1/mpgEOIDPgVSHIwMfly
         G10flH29hLjqqpQKbeZ291PH6KFAZjzYY/dZttocFZkC/+bBxYPDngyd0MCs7Oit1LkD
         yOtK2QU6vts7ePKfGeY7F5Gs7lfjcmX3cuKbCN+PZrbnNL0EX0+v18N0oFIbE6owdm32
         9muRWo/hqWgOdEOaF2QVSuOgLJDl0H6/9Knp+UuNRvy9QUtxp/xX4Jgpl8IK4wlFS+Le
         ivmcd0UokrJjzIbzAqVRR6+HdCrrqvLqdDBBDkrGPLtNx/aZpjSPg7T+Li0ZZkcwj8oh
         SOeQ==
X-Gm-Message-State: AOJu0YxwNUb1zkS1pzikanCeZf3oFKOnM2l6Dz4VKOyajlwJop6Ikuh3
	7eKyJMpSv29KmZg/NvyFO7ffLERfusNGLkN1jjwsOPst0vhy8Hr9wEMXb6tT9xuTOn8Ip3deCLB
	uLsZt0nvZcXM6Uy/YV7UlZm1M+HGrIxd3Pw==
X-Received: by 2002:a05:600c:4f02:b0:409:637b:890d with SMTP id l2-20020a05600c4f0200b00409637b890dmr1941813wmq.2.1698934909241;
        Thu, 02 Nov 2023 07:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNqradnXcYm7rZ8QSIVKLsOjbLArpbJXu4q7NruQLhdfpnFG0KMWxnKwH2zKA5frLi0MpDzQ==
X-Received: by 2002:a05:600c:4f02:b0:409:637b:890d with SMTP id l2-20020a05600c4f0200b00409637b890dmr1941789wmq.2.1698934908848;
        Thu, 02 Nov 2023 07:21:48 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:21:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com,
	yishaih@nvidia.com
Message-ID: <20231102101727-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231008112555.473895-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the device context fields
 for device migration

On Sun, Oct 08, 2023 at 02:25:50PM +0300, Parav Pandit wrote:
> +\begin{lstlisting}
> +struct virtio_dev_ctx_pci_vq_cfg {
> +        le16 vq_index;
> +        le16 queue_size;
> +        le16 queue_msix_vector;
> +        le64 queue_desc;
> +        le64 queue_driver;
> +        le64 queue_device;
> +};
> +\end{lstlisting}
> +
> +One or multiple entries of PCI Virtqueue Configuration Context may exist, each such
> +entry corresponds to a unique virtqueue identified by the \field{vq_index}.

So consider this example. In practice it is quite possible that
driver is in the process of specifying e.g. queue_desc, and it
set queue_desc_hi but not queue_desc_lo. Then what is queue_desc?
Just a combination of a legal value of queue_desc_hi and
illegal one of queue_desc_lo? This makes no sense.
queue_desc is fundamentally undefined until queue is enabled.

This is why I suggest that we have records that match
the transport. Offset in structure can then we used as a tag and
so we do not need to come up with new definitions for each single thing.

And, this is only an instance of the general principle: do not
have two definitions of the same thing. In fact I'd argue our
transport structures are an example of a bad design and the
cost is that less used ones like mmio and ccw sometimes lag behind
on features.


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

