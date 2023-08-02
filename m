Return-Path: <virtio-comment-return-6964-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6560DC00528
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BDFC6F3F44
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:35:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99CD6986649
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:35:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 874AC98660F; Wed,  2 Aug 2023 11:35:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 11F52986636
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 11:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: __sfg8rKMhSV7i9Ya4rxRQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690976125; x=1691580925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drmFXbaHzPPcX4ieDOvPqRHCdETFxDbevzuN11mb7Ic=;
        b=jdmUxXxjWCnMpSqNqOnBqddvhFHfMNlJ+ezx6GrTdqANWwLRCgmISYr2i4/bRqE3VS
         OCh4qeUb063vctAiGBXdKRl9TPYNqt/Au/ZFnBUZtF+bohm4W/lexeZ3rCZbn4Ueztri
         EoTRYpAy4SbiQ6YbG62WJSduG8QQ52K1oB1PWJdOQ6kDQ9qckM2ev1aNAYzPLsNxcezs
         U3EP4kuHJC1iKO7IVMLvwYvftvwCZv5RdHmbZ7fh8roSjhI4jtifUWKQysGq6wYy2TUj
         Gx7JqfZe304sDuDAgmNa25kbs7gPdGzv7GjY+daSJwvKcMBXrEZxXFJowxSiDH0/7z4O
         RvEA==
X-Gm-Message-State: ABy/qLZ0RpB+itqXyk/zB7sZje7WiEfbWPpbIDzowzRTfMLCjSwpyKO9
	U/2/kxMq22OOMIl7Lor5NFdli8bkEUk7+mee2saz66KqS09m5P7tm05e1l6E3yckYYRtCvEJKI5
	F8zjMvxWC0VdEOFEuV7rEiuQJfD2Z57rJjQ==
X-Received: by 2002:a7b:c5d9:0:b0:3f7:678c:74b0 with SMTP id n25-20020a7bc5d9000000b003f7678c74b0mr4706233wmk.12.1690976125683;
        Wed, 02 Aug 2023 04:35:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHODP/TJoYIczDWqGX7oDhPIKVUxHy1Gl67O2TuflpxS3p05RGme7hkCfbjNzYaCc1BTkWmuA==
X-Received: by 2002:a7b:c5d9:0:b0:3f7:678c:74b0 with SMTP id n25-20020a7bc5d9000000b003f7678c74b0mr4706218wmk.12.1690976125377;
        Wed, 02 Aug 2023 04:35:25 -0700 (PDT)
Date: Wed, 2 Aug 2023 07:35:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Message-ID: <20230802073108-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
 <PH0PR12MB5481E0E5AFEEEAA10FDBEFDADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E0E5AFEEEAA10FDBEFDADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: proposal: use admin command (and aq) of the device to query
 config space

On Wed, Aug 02, 2023 at 10:00:09AM +0000, Parav Pandit wrote:
> 
> 
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Wednesday, August 2, 2023 3:11 PM
> 
> > > Get and set both should be inband for PF, VF, SIOV.
> > > I don’t see any need to diverge and create any weird combinations differently
> > for 3 different device types.
> > I am not sure, when passthrough a device to a guest, the guest driver ownes the
> > config space of the device, if we allow changes against the config space through
> > admin vq from host, it looks like a risk.
> 
> I said the opposite above, get and set is INBAND from guest driver to device for PF, VF and SIOV through its own delegated resource.
> There is no AQ mediation from host.
> Hence, there is no risk.

I think there are different requirements from different people.  For
example, consider compatibility. I know it looks like super important
right now, and we should make it possible, but it's just like with
legacy interface - looked very far away when we introduced
non-transitional, to the point where an option in linux to disable
legacy talks about "flying cars", but the flying cars are nowhere to be
seen and, while we are not where everyone can just drop pre-1.0 bits, a
bunch of people are using e.g. vdpa without any legacy, express devices
in qemu also disabled legacy, and so on.


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

