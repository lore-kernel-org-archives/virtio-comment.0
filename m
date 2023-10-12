Return-Path: <virtio-comment-return-7694-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C0FCDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:03:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C7DB157EE9
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:03:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3985A986835
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:03:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 25FF798660E; Thu, 12 Oct 2023 13:03:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 153B298660F
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 13:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _chUCeEsPz6PmxlagMmCLg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697115817; x=1697720617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAUA3wejEbzM3z976uWY0z4/78TvETVCG+qCzDcy/YU=;
        b=T2wdoXiRInIvnLCONG9nKRDPciay0Iqegk5AI1Atl+sAbOUy2QTeNd07DlHl7UhYxO
         +QwRqT7tLASmmG0sM3nWz+Cici0ZHFA1oItXe3dzVwynnwte1rlKvFxkO7mLKpYJ+bFO
         byfrNw5xF5nyQxWO3NytquuP/t9G5IDI6vMlhdEbdStqjf0aCILJGKilS20bYEMXEUG8
         FlgMoC7yPT/QCmkPVb7gQlk7MNTc9Ts1pthLOvVfn0TdJ1mBLsTargOLEhPe5WPMmGOz
         UQZNFizeX0TzMAjwZ37yDYQUC3vYdim6WIZe4koE1alPM/0EQkT/XcOhiLWgTnUB1fWJ
         hg9Q==
X-Gm-Message-State: AOJu0Yyn4oUvQpfP9nogjATSNnW1wJu5SjbFb+3JJoJ8AjNj9M2Bd91v
	IHDqevPDsZSzkQbcOm5fz/1T6c8jQCY+cgqxVWyUlqt3CqLYCVSe+9Yy8ViGKCoShtKbeTUp5yw
	JkWJwb47JuqbitQc2I1ywRNoreMalnNT4ig==
X-Received: by 2002:a17:903:443:b0:1c5:ce3c:c391 with SMTP id iw3-20020a170903044300b001c5ce3cc391mr20377517plb.12.1697115817052;
        Thu, 12 Oct 2023 06:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG60sAZmDodYZpTTwMrKsSpHUNnnr4+FC4HMKFjpPjFZinX87mWKDjqo8s6WXMoFZEXxrebCA==
X-Received: by 2002:a17:903:443:b0:1c5:ce3c:c391 with SMTP id iw3-20020a170903044300b001c5ce3cc391mr20377476plb.12.1697115816419;
        Thu, 12 Oct 2023 06:03:36 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:03:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231012085859-mutt-send-email-mst@kernel.org>
References: <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 12, 2023 at 11:37:01AM +0000, Parav Pandit wrote:
> As Michael said, software based nesting is used.. 
> See if actual hw based devices can implement it or not. Many components of cpu cannot do N level nesting either, but may be virtio can.
> I don’t know how yet.

It is worth pondering though. Can you give it some thought?
I am thinking of a special bar region (or a couple) through which admin
command structure can be exposed, and a special group type that
refers to same pci function.

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

