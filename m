Return-Path: <virtio-comment-return-6967-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCBAC001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:50:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 814B02AD42
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:50:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67CD998664C
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:50:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 56D6F98660F; Wed,  2 Aug 2023 11:50:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4372298662A
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 11:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _3HLabLFPwCB16xYCF8MQA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690977048; x=1691581848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttZzNIU6hlqphY3V+b5yxBWvFFldAnqmquE8CrQ030E=;
        b=cz0MCGPmM/qZdOo9gNUu6Tkf3b+BEGZaB8ETFA69OzScIrhSIaYJGmKhc+8Mgxekrs
         VD89zVVOZEbVg9nfwDxBuRR91bP9w1Bfnruh7p04VBN7aMbRhb7iEEcSvt3C+qWUo/Sk
         HcbgH6rBRmHJyk0nNwUWLQw4bvvTS8p2A1IfIEsZKOZOoBhUYp1claJ4hn+7vXMlf3bg
         +cyLl3gVegy7OVX6m8Jb9mevemFjMTIhTA/fx+xkpcFiwoJB8Z0SW68UKh6sGOrZSp8A
         kvXSDzgUu+as8DxWH5EIj51Kpa6vfQUwlT12r2OiRy/VOMM1nGP2HrlzArWCw+innze+
         aCsw==
X-Gm-Message-State: ABy/qLb1pRC03ro/dAg1h8DIXId9r1SUmpq2C8VAQeOVmdudKcqdv0ou
	IYCm2VICdSlqu0Be878VgJMwW9o2C/dgIxMoOebrCjNXXnqe6wEuWfSM8/Hgw/0hJwJJXd5dAHe
	36/uKAjFZFxX2e4NwpxO1S8ZIoRPWGVYDmg==
X-Received: by 2002:a05:6512:2826:b0:4fb:7675:1ff9 with SMTP id cf38-20020a056512282600b004fb76751ff9mr4447619lfb.9.1690977048380;
        Wed, 02 Aug 2023 04:50:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHfWwQMNkA42P9jmk+AVCMjDFrBvO9buRzYAseyqSYwgQ8WVIbh09bQPr5YVYzPJoQxYledMA==
X-Received: by 2002:a05:6512:2826:b0:4fb:7675:1ff9 with SMTP id cf38-20020a056512282600b004fb76751ff9mr4447603lfb.9.1690977048019;
        Wed, 02 Aug 2023 04:50:48 -0700 (PDT)
Date: Wed, 2 Aug 2023 07:50:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Message-ID: <20230802074630-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
 <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802071603-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548071770075800FD9020D27DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802073700-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54804B56DDF38E56DF7FF4F4DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54804B56DDF38E56DF7FF4F4DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use
 admin command (and aq) of the device to query config space

On Wed, Aug 02, 2023 at 11:44:46AM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Wednesday, August 2, 2023 5:09 PM
> 
> 
> > > Sure, device config is the real pain point we are trying to solve first.
> > >
> > > Using cvq for those devices who has it seems the most optimal approach.
> > > If we liberate ourselves from single monolithic config space structure and
> > move to query device capabilities, resources, configuration, at functionality
> > level, life is lot easier.
> > > What are your thoughts?
> > 
> > Splitting transport and device config is exactly what I'm talking about.
> > I agree transport should probably be split further - it only made sense for legacy
> > so we don't need to spend specification effort on legacy.
> > splitting device config would require changes to all devices - I don't see how it's
> > worth the effort.
> 
> Maybe I was not clear in my idea.
> We have canned ourselves as config means _one_ structure.
> Due to this thought process, all these transport and things muddy the view.
> 
> If one think of functionality-based config, there is no one structure, hence no need to limit ourselves to it.
> Taking concrete example,
> 
> We have separate commands for,
> a. RSS config
> b. filters
> c. notification coalescing
> 
> When you have matching get command, then each functionality grows by their own get command and no need to put in single box of single config structure.
> 
> Every device will be able to grow to dynamic need as/if it arise.
> 
> 
> 
> 

There's one thing to say about putting everything in one place,
and that is that one can then find everything in one place.
For example, at the moment we actually do have a problem with cvq,
and the problem is that it sets internal device state
that is not observable (unlike original pre-1.0 config
space which was writeable).


By the way there's a pci express ECN for relaxed ordering or something
like this. I am yet to look at it, I wonder whether it can be
used to avoid the issues we have with MMIO in a way
that is easier to use than DMA.


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

