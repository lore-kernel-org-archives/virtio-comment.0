Return-Path: <virtio-comment-return-6972-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B68C00528
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 12:09:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 84F46747CC
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 12:09:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 61D4B98664C
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 12:09:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4EA43986636; Wed,  2 Aug 2023 12:09:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B028986649
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 12:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bIJExWW-P8e1PT5t8LbJ4Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690978186; x=1691582986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnh0jU54d+ANSjR94T/CZGz/W0+A2UP09b/x7YqdldQ=;
        b=JKVvJ0+LVBGzD55bKsmsTw/o5Hih0jv4H+3IgvKoQafxU7ah1edllhneuqD6K5xDr4
         nKAWDq3+One6mxUQ95V3SXT0MckjppHwACcdJhnETp0ZLm898Ne/12/YFG/B79RYUR4q
         2DXw+pMlfWyWJk/NaEMsKn2TIf1VgUCQHZFBy82l0vbGD9ZwTVFfIQ/cavU4/3g90XW0
         XST48i/hGZmLNSuEJfyuN7qPcfQyjAlydCXqCt69mDNChsdrugFun+NQE4Ed/yi1okO5
         6u4SLMec7LCJuDIw4COTsNrxdjshTnL+gtODjhPitg75ejN1N/ged3nEUyJzhHP3JvQl
         jxiA==
X-Gm-Message-State: ABy/qLYOwZezkA2lhmmE+I/n7em3GFON0zFl8pHUFmOdZVnUdupX7uZy
	tFh6MlYrJ9Eql8700D7N/zUa25D8WCNNQ+RBVHY+A6GH3h7jyHSPVDfUGjxSI36F63Ad/CzTKUp
	amAOlURoUsAC0Du7//V6ePqT6zcegT752fw==
X-Received: by 2002:adf:e741:0:b0:317:5a9b:fcec with SMTP id c1-20020adfe741000000b003175a9bfcecmr5296313wrn.14.1690978186386;
        Wed, 02 Aug 2023 05:09:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE5htCenUHkcRBTq+da8QW8Z6Gg5IzYgvz8hAHttNNEDIu1FT5xbmUJEYITO3JCQL3T6gehkw==
X-Received: by 2002:adf:e741:0:b0:317:5a9b:fcec with SMTP id c1-20020adfe741000000b003175a9bfcecmr5296297wrn.14.1690978186101;
        Wed, 02 Aug 2023 05:09:46 -0700 (PDT)
Date: Wed, 2 Aug 2023 08:09:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Message-ID: <20230802075851-mutt-send-email-mst@kernel.org>
References: <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
 <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802071603-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548071770075800FD9020D27DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802073700-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54804B56DDF38E56DF7FF4F4DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802074630-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480CBCB70621CD6BEF5222FDC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5480CBCB70621CD6BEF5222FDC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use
 admin command (and aq) of the device to query config space

On Wed, Aug 02, 2023 at 11:56:11AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, August 2, 2023 5:21 PM
> 
> > 
> > There's one thing to say about putting everything in one place, and that is that
> > one can then find everything in one place.
> 
> When a device grows incrementally and each functionality also, 
> grouping it per functionality gives better pace to keep things self-contained.
> 
> Think how messy a set command would be if all 3 functionality in one set command.
> 
> > For example, at the moment we actually do have a problem with cvq, and the
> > problem is that it sets internal device state that is not observable (unlike original
> > pre-1.0 config space which was writeable).
> > 
> Which part is not observable?

e.g. rss config.

> > 
> > By the way there's a pci express ECN for relaxed ordering or something like this.
> > I am yet to look at it, I wonder whether it can be used to avoid the issues we
> > have with MMIO in a way that is easier to use than DMA.
> 
> Waiting to deliver new features on new PCI standard will drastically slow down virtio.

features? surely not. but when we are building a new transport then
we are building for the future, it takes years for a new
transport to be deployed.

> I don't think its good idea, but I would like to know about such ECN, if there is one.

I am talking about unordered IO (UIO) ECN.


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

