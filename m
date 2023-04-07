Return-Path: <virtio-comment-return-5318-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB79C6FD1D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 15:54:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 40CD942BC0
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 15:54:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2BEA49865DD
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 15:54:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1D3AB9840C0; Fri,  7 Apr 2023 15:54:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0CCCD9865DA
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 15:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: I5urAAVgOP6cCtPmq0HjCQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680882876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzdhRpao5n8NDb4/Dv5UjgOKFBi7sGg4/XyEokAQ2JI=;
        b=btNhib2O0GvOKthPHyrENP6FIFGBYalBK2PZtTsmsTaetPoL49BxozX6CGK+VBt+69
         tKvNl30HnaQvxd5QDcIrKRT8s2oVt+aMAVBrgjaaGADG7bolk6tHAjYHv1Zifcgpi0Bz
         hSqd+7nE3cVJESQGO8uX35YgXaWeG8GqVayC0KOgs/XGVIBGlv0WQZOMpZkcmHF+/7ai
         qov5Ia86FkpDgLhWZSAqqHoaw/9FrcWypCOuffpbI4iDbV0qkMRVpYJTva5b5ghxYjC2
         O/9gMp5v3Y2TFXaM9+I4Nn8TKVZWbVzYsN4q8K3rLXeOYuAr7b0fwRLOh+MvjFrV5Vbf
         5SZw==
X-Gm-Message-State: AAQBX9e252sY9s1sr0squKmZCOYvC+q8W7kO1/Z+W7VCK7uPtWC7GA6Z
	o4ehqBY/FvOL9MzD/B331d1tpeA7G1ax2ud8G6oX3ng5EYgvmABh6S6zk0fU3lg3URI4W6ahmUE
	VR4tnVpFxprEesdc8PUrehbM3fNzo9Q5WdSROY2Pdbg==
X-Received: by 2002:adf:f4ca:0:b0:2e4:e6b3:78ca with SMTP id h10-20020adff4ca000000b002e4e6b378camr1512677wrp.70.1680882876616;
        Fri, 07 Apr 2023 08:54:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLPfkkZ3u04ckCMhhMryy92CSvxvVyuvyvJjCvB5mM2X4PXOUCNMfuhTUGUaN2nBU1wGbncQ==
X-Received: by 2002:adf:f4ca:0:b0:2e4:e6b3:78ca with SMTP id h10-20020adff4ca000000b002e4e6b378camr1512664wrp.70.1680882876325;
        Fri, 07 Apr 2023 08:54:36 -0700 (PDT)
Date: Fri, 7 Apr 2023 11:54:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230407115146-mutt-send-email-mst@kernel.org>
References: <20230405010657.612529-1-parav@nvidia.com>
 <20230405010657.612529-2-parav@nvidia.com>
 <20230405051801-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810141129464569ECCC825DC909@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230407072815-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815B064A1622B963EEB69FDC969@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815B064A1622B963EEB69FDC969@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] RE: [PATCH v12 01/10] content: Add vq index text

On Fri, Apr 07, 2023 at 03:34:19PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, April 7, 2023 7:30 AM
> > On Wed, Apr 05, 2023 at 01:03:29PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, April 5, 2023 5:19 AM
> > > >
> > > > In fact can we just say "virtqueue index" everywhere? The less slang
> > > > reader has to learn, the better.
> > >
> > > Wow, didn't know that "vq" is a slang. :)
> > 
> > And so is "virtqueue".  It is certainly not in my dictionary of standard english.
> > One term to learn is enough I think.
> 
> Sound good to me.
> With above reasoning please replace all "vq" with "virtqueue" in the commit log and the spec area in aq series v12.

commit log does not matter much, it's for us spec experts who know
the jargon :) I did not think aq patches say vq anywhere
but if yes I will change that, sure. Feel free to point it out.
Abbreviation of register names is probably ok, I'll check
whether other registers are abbreviated or not and make this match.

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

