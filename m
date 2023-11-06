Return-Path: <virtio-comment-return-8207-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA3C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:06:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B52BA60D2C
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:06:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97FDF98672D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:06:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 80C5598671A; Mon,  6 Nov 2023 11:06:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 703D398671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 11:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: q87OSwbkMzmwa8YsFrBdUw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268764; x=1699873564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnENbs+l2YgxPg8EoZowseHLVmHdP8L6H2PYRrtrcm4=;
        b=Re4yBgJptpEVOCFE9I9G6b0tyCMwZMbeJV66IB0m2oBp3rsUCkeAyapmmGqlRBHKak
         WValClAQEUHe7KDlLBrSqBcHYx3edG805NBe5vSVs5Rrr79ax1Npfoj+FrUkIR+gmLFp
         Rw1tlhnUSoz8rcADPaQAd6qUWOn+reE+Jf8EoX6gpa0YDIRA947eoLquEAloFe2lJJck
         wpiD0MzpD5dnDodSEuOfW57BP10hY6L7xnGQaTHH1ygk8wNJS0vJPGuTGhYuWrubxA6h
         ZWM8+cYAGo95Ig3YoavNb+aaYdz0FGbsGisZjtn1mOVi2xOXv8QlUWSXcK0zqs+Pl6ar
         GvYA==
X-Gm-Message-State: AOJu0YzeTErsfrzjvkyDYCUFTWsYZL3Akoli6UFwR3PagxHRAd6l0g/s
	b8ZER37z8wA1w/urNkFg4eX4EsrlpZ2sdghVOL+568KXExd9/eOXvstmGQjzdsHrIH3jH4w5cz4
	+Je6o8yGIiCFXKXQW80iWIncsTlnEAKb84w==
X-Received: by 2002:a05:600c:a03:b0:409:5c2b:43d1 with SMTP id z3-20020a05600c0a0300b004095c2b43d1mr12394274wmp.20.1699268764424;
        Mon, 06 Nov 2023 03:06:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR7QF1F01hXef0RXXXO2U3+KPiXcO0auxiQXrxjPD5GlNGvXOA8+5aqSpYuXDdyPjwdfqBtg==
X-Received: by 2002:a05:600c:a03:b0:409:5c2b:43d1 with SMTP id z3-20020a05600c0a0300b004095c2b43d1mr12394251wmp.20.1699268764020;
        Mon, 06 Nov 2023 03:06:04 -0800 (PST)
Date: Mon, 6 Nov 2023 06:05:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231106060447-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54813004E47B8F18DFAC1D57DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813004E47B8F18DFAC1D57DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Mon, Nov 06, 2023 at 10:52:46AM +0000, Parav Pandit wrote:
> I read the pci spec and I see only 3 operations which does not have atomic or.

CAS+retry can be used to implement any atomics including atomic or.

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

