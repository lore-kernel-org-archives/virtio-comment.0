Return-Path: <virtio-comment-return-7317-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3133CEE7FF4
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 10:15:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F4DFC6108
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 10:15:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 69591986466
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 10:15:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5611A98635C; Mon, 11 Sep 2023 10:15:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F5C6986408
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Sep 2023 10:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5x7EmzD6NLOe0ym1EJObEg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694427307; x=1695032107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxiwxp0bW8jt18giaWNogdzlb2xgehRukN+u779xslw=;
        b=qn3S5vPQ80ZPfeZoiADwE8Q9W9mt5GOKU+jXtJ6BSBFAGzHiDAgaEI7y+O6A/kcmYT
         ri7/KEvISofu+rqd5KXaiYVCATEjjt60KPz/2rFUTLzar6qNz81b6mkAOQ0ANUMXnXEo
         FHXdnRkzf4YeXmcht79desQyrszom+fne5kiZFJb4NhxhqXfivuZJEH+r3dRLVM5jLGx
         DmrlNF4yMYSHJPFpSR960ZlTU4QlgdhGmhOQqQe0RvPVE7bKQWkO02z11RYlrnaYegAx
         Oke8+4yc3Pc9iuXT7XIwWDJjwh++NJamkoVz7sQ9Zd9bKg4Ea5xU8mjUgw7cu2Kro/Jp
         bruw==
X-Gm-Message-State: AOJu0Ywtc3fwddYYmTTqfZlJqLXVvBV/zolM2Y/I8rGS74OqhoJFeiqz
	lj+QUo3WKatbrZ1W/XC/sJt3qoxf4rpMrLnuhOAGbQbTDm/ot43UAV8Pb4KrVp/3UvnlfuiOnnm
	H4mmD+Je2Cysal6IByFO2z4IEqEvRYX1nCQ==
X-Received: by 2002:a17:906:749b:b0:9a5:852f:10bd with SMTP id e27-20020a170906749b00b009a5852f10bdmr7358148ejl.62.1694427306975;
        Mon, 11 Sep 2023 03:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDf5MrUCYNPHCVIf7O11V9vtA09YTru1ALsOK1XpVVG5JTHdEtTU56supvysrY6uFzbXCf3Q==
X-Received: by 2002:a17:906:749b:b0:9a5:852f:10bd with SMTP id e27-20020a170906749b00b009a5852f10bdmr7358137ejl.62.1694427306621;
        Mon, 11 Sep 2023 03:15:06 -0700 (PDT)
Date: Mon, 11 Sep 2023 06:15:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
Message-ID: <20230911061236-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com>
 <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Mon, Sep 11, 2023 at 02:30:31PM +0800, Jason Wang wrote:
> Customers don't want to have admin stuff, SR-IOV or PASID in the guest
> in order to migrate a single virtio device in the nest.

Built an alternative facility to implement admin commands then.
The advantage of admin commands is they are nicely contained.
This proposal is way too intrusive.

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

