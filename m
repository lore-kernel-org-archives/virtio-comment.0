Return-Path: <virtio-comment-return-8142-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6983FC4167D
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:47:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B2C242A8F3
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:47:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9EA10986C34
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:47:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8A103986C2E; Fri,  3 Nov 2023 10:47:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A0AB986C2F
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 10:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: blf7-kUTMRmMo5ESE1KQbQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699008421; x=1699613221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGwBfhNNOUiaPU+Q7WV+TMWM0VEU4ZvORYTMeBWF8EM=;
        b=SQIEgDeQ8wEjgWMWXw2L5KRD0LYEa+X47K6tmK97efH8OXuKnGoUD7f0dC5A6q9JMA
         /1YAEYz4cK/FqhPf9P0bWEDVwgyc2zOTrE2laHL/cVTViZhVKDNH21yWOrmcpyeR9/HL
         49PlUDkgYtWmD6diN7EKN79JIvCuxV4ni7TJlp7ldrcK/+Ew1fLI3wAPv+vEr/ta6eHn
         VRqDaCblAXoO3SZd5D8A735pSufNQB3ftv5moI6dsxIxP5ewUkSNrOJjFsYmV1RcTAK2
         ui0icdXLU49YFQe3WM0wv+Bs6R9yoHo3m2q2BLhdiF22slKs/NteqU8fDHLPnKntoWMT
         10sg==
X-Gm-Message-State: AOJu0Yy5f4NSWuUF0jCIUFjSiAl44pCOfEy0c4zX2RX3QnP/Da3sUheJ
	yfFn38TtwTY9FYKQy4yKn146IMTisltVFROgGmKF2CGNmv7YjpKinLO90gwMSyZhQCCI6K5f4rE
	f5IGEL6mlp25fH3EmUh2LDx5SguUTCYGBog==
X-Received: by 2002:a05:600c:5488:b0:405:9666:5242 with SMTP id iv8-20020a05600c548800b0040596665242mr19122998wmb.31.1699008421245;
        Fri, 03 Nov 2023 03:47:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGceklFwHonWDlKomPdmHCNsO2q0Ya70ChlcbUMnU7KiLSHaScMyQN2+d5Pj6i5fm2aKb+KOw==
X-Received: by 2002:a05:600c:5488:b0:405:9666:5242 with SMTP id iv8-20020a05600c548800b0040596665242mr19122988wmb.31.1699008420897;
        Fri, 03 Nov 2023 03:47:00 -0700 (PDT)
Date: Fri, 3 Nov 2023 06:46:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231103064352-mutt-send-email-mst@kernel.org>
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
> +\begin{lstlisting}
> +struct virtio_pci_dity_page_track {
> +        u8 enable;               /* Read-Write */
> +        u8 gra_power;            /* Read-Write */
> +        u8 reserved[2];
> +        le32 {
> +            pasid: 20;           /* Read-Write */
> +            reserved: 12;
> +        };
> +        le64 bitmap_addr;        /* Read-Write */
> +        le64 bitmap_length;      /* Read-Write */
> +};
> +\end{lstlisting}

Okay, so it's a simple mailbox in config space.  Which by itself is
probably a very reasonable idea - more or less what I suggested.
However, using such a generic facility just for the dirty bitmap seems
too limited.  Please make it accept arbitrary commands. Reusing admin
command structure with a special "device itself" group sounds like one
way to do it.

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

