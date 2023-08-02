Return-Path: <virtio-comment-return-6965-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0959C001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:39:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 105B9157EE5
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:39:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E3B459866AE
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:39:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C9C8998660F; Wed,  2 Aug 2023 11:39:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B67F8986636
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 11:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: JFyuCbLmP7aSr1DBf8sIOg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690976356; x=1691581156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpVS3+V4N3mL88fG9gE6F1zWSTh9eK+WQ+Haehlt4Jk=;
        b=aDjt7Eziu6xiS/NQqyp0VhUhuvKEa2pkOr9Qfj3sWHBflpT4c1lYS9xvlR96DdecZ4
         /qQAG9Nmabah25ZEeyRFFLHRYyi2BCM62PBBxkQBOgzKO+w+SPvM/Vgh7xMFDySlsq2F
         +qm6g0U7snkQH+m9DfwKpFmxRxogZDwOYbKip9OQwEwwT9+4JGrbeVZa5MXp50fiSDUp
         tdpTp442TCUXGpynSt8XDlkz7UK2wZDqcWg1pw0eQYbeFt65Tep5HRt0ye/P5zzQm5ua
         zDYCMfqv+5zXIGDXsO9+quRNgfPFo6BSRR+PmxpQNg9uUfJJq3MbHlpSrVa+G5Dv/wR0
         LKaw==
X-Gm-Message-State: ABy/qLaj7NR9/F9CAMt1/p/qu/66CSBkLDjMWR5vdpc0qeUeviG5rG1A
	iCQrwcrmSn7W3FjaDskWLQ3DlWdyjMt4l+HaJSqDwxxGzBrFXzyGD1Qag6pSm9cGCDNDkRbLm0r
	ND34vY/eI5FaWtw0zoLEqp9fNeiQbtcu4LghShP6CUg==
X-Received: by 2002:adf:e50e:0:b0:315:adf3:67db with SMTP id j14-20020adfe50e000000b00315adf367dbmr4231681wrm.59.1690976356760;
        Wed, 02 Aug 2023 04:39:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHPbMJQuEEfAFrZBDWBWSkIa+uXX0Qf3kSUoBQYsVhEF2uimalRH9vZgGtNUZqvZiiLW+u8zw==
X-Received: by 2002:adf:e50e:0:b0:315:adf3:67db with SMTP id j14-20020adfe50e000000b00315adf367dbmr4231667wrm.59.1690976356439;
        Wed, 02 Aug 2023 04:39:16 -0700 (PDT)
Date: Wed, 2 Aug 2023 07:39:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Message-ID: <20230802073700-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
 <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802071603-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548071770075800FD9020D27DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB548071770075800FD9020D27DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use admin command (and
 aq) of the device to query config space

On Wed, Aug 02, 2023 at 11:29:53AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, August 2, 2023 4:56 PM
> > 
> > On Wed, Aug 02, 2023 at 09:57:47AM +0000, Parav Pandit wrote:
> > > > If you care about admin
> > > > virtqueue then device configuration space is not the only thing that
> > > > can be "ever growing", common_cfg is another one.
> > > The idea is to do minimal bootstrap work from the common config space and
> > switch to the queue.
> > > So common config shouldn’t be growing either other than minimal bootstrap
> > functionality.
> > > Hence, common config also to be available via dma command.
> > 
> > That is more like a new transport. I thought this proposal is focusing on device
> > specific config - let's get a handle on that first?
> > "common config" is a pci transport specific thing.
> 
> Sure, device config is the real pain point we are trying to solve first.
> 
> Using cvq for those devices who has it seems the most optimal approach.
> If we liberate ourselves from single monolithic config space structure and move to query device capabilities, resources, configuration, at functionality level, life is lot easier.
> What are your thoughts?

Splitting transport and device config is exactly what I'm talking about.
I agree transport should probably be split further -
it only made sense for legacy so we don't need to spend
specification effort on legacy.
splitting device config would require changes to all devices -
I don't see how it's worth the effort.

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

