Return-Path: <virtio-comment-return-8267-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E89C4167D
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:16:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 989B32A8F9
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:16:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D110986CAA
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:16:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5236B986CA7; Wed,  8 Nov 2023 17:16:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4255E986CA8
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 01dG7nC2OIO3lPKe2PbbjQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699463781; x=1700068581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMPJYG9eORGfIUyThIV6RXmczovN+LFJfLZubUvgX6U=;
        b=ubq5ScrBBqhPt9bxTkqShUs6fhNWtpEvgA+KWM/tHi+nynuIO3jxHIF8zCilnRGdxu
         rvjnHHyhMe9X/TE6L8DClmefmaLVTjKTxPv501dmyzdrk0KyfU/vZFmICvPkUPaa+p06
         mSa/66L5B14uDn7oRIRW/nVKMbG4VhGHHLoM8/l6+XNegBYIpGzpSMoaQw38o4nHBX+h
         AFK5sULlo4o1H998ByNz6PkAZt6Hgqq299k5WblhpKXInxBBLr7v/tTtnhjAK4N3EriH
         OuDn+3/9uBOAa1FzHfPbnd48sum4A/kut6zUB7rkkbZ2xDJ9XmSFTmEkv4pZZT/DTOjb
         xcZw==
X-Gm-Message-State: AOJu0Yx55FVNx3de5NPFWKYbVXk8ZPuMulXFG69GrAT0NZO+U0xQY+qa
	Fnsv14SpsPvbbbzv0zTMauI27a7rtgHhSh2Hdbl8nE9WYj8jEAdZwSyXcBR3g3XUlaUj7zWY2z2
	MM770PG6yI4ylfKz5OJr3TKAxrNDiQoCk8Q==
X-Received: by 2002:a05:651c:1986:b0:2c5:1674:8d79 with SMTP id bx6-20020a05651c198600b002c516748d79mr2933725ljb.21.1699463781265;
        Wed, 08 Nov 2023 09:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBgCyayAx+tVFwwaNIknFCx1M3xZv2JUF65k6TQKFJjebOgH44mcjY4CuX7JnTo3Ek2rK68g==
X-Received: by 2002:a05:651c:1986:b0:2c5:1674:8d79 with SMTP id bx6-20020a05651c198600b002c516748d79mr2933698ljb.21.1699463780813;
        Wed, 08 Nov 2023 09:16:20 -0800 (PST)
Date: Wed, 8 Nov 2023 12:16:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231108120828-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819D42D98DB9BB95800947DCA8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54819D42D98DB9BB95800947DCA8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Wed, Nov 08, 2023 at 09:00:00AM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, November 8, 2023 1:47 PM
> 
> > Only for TX, and I'm pretty sure they had the foresight to test RX not just TX but
> > let's confirm. Parav did you test both directions?
> Rx is the main part to test for the dirty page tracking.
> Tx only is around ring updates, so not very interesting test.
> 
> When page tracking is started, there is impact on Rx as natural throttle by slowing down rx packet rate.

Wait a sec sounds kind of like what we see with SVQ as well?

> And devices have implementation choice to covering the spectrum on amount of drop rate.

What does this mean practically?

> And has implementations evolve, it will improve as well.

Maybe, or maybe not.

> PRI for sure is out of question. Most workload won't use it at all given other limitations of virtio on PCI front and existing PRI behaviors.

Out of curiousity what do you refer to?

> There is also a test with platform IOMMU dirty page tracking done as well but it is very early stage to comment in this forum.

Interesting. That's a very important test I'd say - if platform based
dirty page tracking is just as good we can avoid adding it to virtio.


And I'm rather confused at this point - I was under the impression you
already have a prototype which shows negligeable performance impact
with on device tracking.

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

