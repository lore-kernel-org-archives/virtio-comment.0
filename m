Return-Path: <virtio-comment-return-8247-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEC8C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:31:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2B92044547
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:31:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 12353986826
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:31:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0534E9867FD; Tue,  7 Nov 2023 11:31:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E9B0B9867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SxQ_GT8IOIu89GSkKMU_Bg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699356671; x=1699961471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzcrbZrIsE9L04jrJ4pVswJzehF8uWkWfiy716/sEMA=;
        b=jUbI6thYRUjhnMPWKS49enBYAgzkmRyEk5uGCZDQTcLFcvktUfQSXzKX9AIslWSLtq
         cPdDvKXy3nOxWMVXWJQsP0FJVgvYMpq3fhMlemHvTWt4yMBKrcO9J1TU2vWXn/pa/OUg
         KSLiER7JEjIShdKk+V5E0pAf+2Mntk73ucNnbnmrtZWFVwoTvs5qj0P5Oc2dVX0QeOuA
         DjkJbVWtrrXS+rjDWSR3Mehd58OKam24YHFLvlOrZZIOFbxe8TLThlqu4tIOf/weSY+K
         r8O3mScw/AMiadaHvpg+yCMVNMO/2O5y0gSyLyDviiKJQKIZmqQDP+Fxsc/yy59VdLP/
         KNyg==
X-Gm-Message-State: AOJu0YyswI1Zgo6sx68tCN8+/5AZ3ZRZEP5YDevLPbmDQt7klNpydXlX
	bxRG5/yR7MiXhwM3Viq28FLBe85QXUm4vg+cITjlY13WuH0Nxg1uKJ0OO1dU/s1s+j4edrkfJNT
	9l2/ggpK8LXusLfJN0bjwPqPdNGJDz3s2rA==
X-Received: by 2002:a2e:894e:0:b0:2c5:2357:be98 with SMTP id b14-20020a2e894e000000b002c52357be98mr25214848ljk.44.1699356671599;
        Tue, 07 Nov 2023 03:31:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVEG58BY+hYbImqKtq2NGYBPn5Na+Y0KtEhqGOaEYoiPbyOvfqOE5sroJGBfyWMdWCIXUQsQ==
X-Received: by 2002:a2e:894e:0:b0:2c5:2357:be98 with SMTP id b14-20020a2e894e000000b002c52357be98mr25214833ljk.44.1699356671274;
        Tue, 07 Nov 2023 03:31:11 -0800 (PST)
Date: Tue, 7 Nov 2023 06:31:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231107062958-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com>
 <20231107051012-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813AC62A9D6811585A159DDCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813AC62A9D6811585A159DDCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Tue, Nov 07, 2023 at 11:12:47AM +0000, Parav Pandit wrote:
> Didn't you ask at start of this email to stop debating on what is passthrough?

And I'm suggesting some other terms that hopefully will describe the
use-case in a generic terms as opposed to whatever is in Linus' tree
as of Nov 2023.

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

