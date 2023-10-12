Return-Path: <virtio-comment-return-7697-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CCECDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 14:39:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E0DBD6E6CB
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 14:39:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D22B8986840
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 14:39:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C20A298660E; Thu, 12 Oct 2023 14:39:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B4C8E98660F
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 14:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -gpCaxLIN5SZ0neRXiCBiQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697121536; x=1697726336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzml0iyqfQH/MdpjCphG/JYkQGuFv9sIOQJFHoxBFEA=;
        b=NQZwjODdbD/qFM5OmTBaZ+MaQpycqzChqTPwf7uGaQSyqvvpRqbUNwrLDhs5mNsYDu
         bXu0Q6y57yZazXMeZL9lyUA3bq1gl47ZWyaqsGV2YI7uzgNCWYf5Szu2GsXJqkSJhtCg
         MIZak5y0k8ckyCHOj23nj+Kp50TjnPcmXLxAGQFx5XPEOQnI4Jevd1Xut9F6fz/n08VX
         U7POToiTBF9adE89CKOX3XRR9BWaeWjjEGJPVNPV8OS43ujg0GGCdVMvPCHB6jGzx2or
         WVPzBciUiVn4ujulvHVqrIyozfL6FeujvxmsYszQG4dUBlwVJm6Sl3Ln+p8uHIlPssqI
         puYA==
X-Gm-Message-State: AOJu0YyWrLK2TgDMl2KoZf9nRKY6MwqVbMqKsr08YYvwAYzJoDPpuAIX
	HGFP7+QaSV3PK4l4b9HKFKQXrJoCMSOfQuBcjvsqU98QCEGdy97JFjylbO6fgloeU4ISh26P4sC
	vJIvCNuDvJnp6pg9Zwisq1imDFRF5xLqcCQ==
X-Received: by 2002:a7b:c7c5:0:b0:404:4b6f:d70d with SMTP id z5-20020a7bc7c5000000b004044b6fd70dmr22371443wmk.17.1697121536683;
        Thu, 12 Oct 2023 07:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH32/juQ6369zcCWKv75wMn3oAkYXTyqoEkH3QJNi1WwVtByF9w1YCqXpeF924HT+wHlEc8Zg==
X-Received: by 2002:a7b:c7c5:0:b0:404:4b6f:d70d with SMTP id z5-20020a7bc7c5000000b004044b6fd70dmr22371432wmk.17.1697121536300;
        Thu, 12 Oct 2023 07:38:56 -0700 (PDT)
Date: Thu, 12 Oct 2023 10:38:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Jason Wang <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
Message-ID: <20231012101046-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481C57B255B0D5EA6FB109DDCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ddbd47c8-6985-2d08-bf98-0e7516f0c3c4@intel.com>
 <20230926064201-mutt-send-email-mst@kernel.org>
 <305d9907-9668-d362-1ff2-49a5e9f90e42@intel.com>
 <20230927113510-mutt-send-email-mst@kernel.org>
 <558fe3d6-0b81-4def-7256-52ac3cbffa8f@intel.com>
 <20231011061508-mutt-send-email-mst@kernel.org>
 <373821b2-1a1e-3bf3-51dc-8af54db85d00@intel.com>
 <20231012054804-mutt-send-email-mst@kernel.org>
 <ce8a8000-8ed8-66fc-71f9-db560975c100@intel.com>
MIME-Version: 1.0
In-Reply-To: <ce8a8000-8ed8-66fc-71f9-db560975c100@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [PATCH 0/5] virtio:
 introduce SUSPEND bit and vq state

On Thu, Oct 12, 2023 at 06:49:51PM +0800, Zhu, Lingshan wrote:
> For PCI based configuration, like MSI, we need to fetch from config space
> anyway.
> For others like dirty page, we can store the bitmap in host memory, and use
> PASID for isolation.

Ok. So how a about a simple interface along the lines of
u64 cmd_address
u8 ready_flags:1

For this kind of stuff?

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

