Return-Path: <virtio-comment-return-5366-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98786C76196
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 10:37:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CE1998748B
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 10:37:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C83C79865F0
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 10:37:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C02BC98636E; Tue, 11 Apr 2023 10:37:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0DDB9863A7
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 10:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: S-qSdu5bO5uOUYfNMUcckQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681209433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWF8Nkc28LxPsaSyPW6GzUbP2WFsgaMBe6p062JCmXA=;
        b=KB1NnNv/RZWsKawsAOg+DJ7krK/DBrY2r8WigWoPpi6AR2KTPth+Lig9cEjzwh09xJ
         BIgZNHBN0NoluwMumeFMQDR2uSvwiKYpokOfRh0Iwgo+j/1Gl1/LiCXan489wHRnrGsq
         T64+ZyWi7zAWMAlTh90xzeIv0f0Gr/fc4TEDmp+zCwk/XpgmmQp4wnP86nrA3HoVyypc
         lY+ZD2cx3xhrBIQYKXqA6agfrvXnhLUp4JVbSxlHPhmtezQbue2rjSN/+zDEkEtoK2ZT
         CQdaSnhBpUh2qd+V5dCjoA2RQIqAuLtVlNuZubF46ohA6BiM360piDk7RyqsQ4LffAml
         z7gg==
X-Gm-Message-State: AAQBX9exqxkxdPbMJ3pmQw7VdHnNBUoZGoeIzoYnWyG4IwgnIn0aZA8N
	8jXfYyG3SWm55Z8JJCslOspXzUSNYsKxNdyNk/56OXK8Q6/J9YMTWVCXuq+ArS1Eiobn9/njSGB
	eWhSWJbcbdJanMibhpeMIRBiivCZ0iQ1j3s6yIIBpwg==
X-Received: by 2002:a05:600c:254:b0:3ef:6fee:8057 with SMTP id 20-20020a05600c025400b003ef6fee8057mr9078777wmj.25.1681209433515;
        Tue, 11 Apr 2023 03:37:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZMbPCbDZ9ONcStbaw6pvg+Z3ajCYruJNxGy4fiWzGUi3+K+Mh1RW1dCMloRDXKtyKks7esJA==
X-Received: by 2002:a05:600c:254:b0:3ef:6fee:8057 with SMTP id 20-20020a05600c025400b003ef6fee8057mr9078761wmj.25.1681209433225;
        Tue, 11 Apr 2023 03:37:13 -0700 (PDT)
Date: Tue, 11 Apr 2023 06:37:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230411063315-mutt-send-email-mst@kernel.org>
References: <20230323152422.113103-1-hengqi@linux.alibaba.com>
 <20230404182925.349d402e.pasic@linux.ibm.com>
 <PH0PR12MB5481969DB61A7CB30E89C3C4DC939@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230404134141-mutt-send-email-mst@kernel.org>
 <c2239805-3f62-ee76-d422-2f6c247b7747@nvidia.com>
 <20230404161213-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D95889A86A9BF9889C5CDC939@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230405050718-mutt-send-email-mst@kernel.org>
 <20230405165444.1f483339.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230405165444.1f483339.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v14] virtio-net: support the virtqueue
 coalescing moderation

On Wed, Apr 05, 2023 at 04:54:44PM +0200, Halil Pasic wrote:
> On Wed, 5 Apr 2023 05:12:12 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > > > it's not necessarily an identifier. can be e.g. just 0 for all vqs.
> > > > whatever the device needs.  
> > > For driver its just an id, content doesn't matter.  
> > 
> > No, this value might or might not be somehow related to the vq but it
> > does not have to identify it. So it's some data, not an id.  Let's try
> > to use words for what they mean in english not try to come up with our
> > own language.
> 
> I agree with Michael wholeheartedly, we should try to use words for what
> they mean in English, especially in Computer Science English, and even
> try to pick the most fitting and least ambiguous option if multiple
> options are possible.
> 
> In that spirit I would say that "queue_notify_data" is actually a magic
> cookie. https://en.wikipedia.org/wiki/Magic_cookie A possible name
> or abbreviation would be vqn_cookie like "a virtqueue
> notification cookie" (I'm not sure about mixing in the direction, but
> this is only about driver -> device notifications). 
> 
> 
> And then 
> 
> le32 {
>         vqn : 16;
>         next_off : 15;
>         next_wrap : 1;
> };
> 
> could become something like
> 
> struct vq_notif_data {
>         union {
> 		le16 vqn_cookie;
> 		le16 vq_index;
> 	};
>         le16 {
> 		next_off : 15;
>         	next_wrap : 1;
> 	};
> };
> 
> BTW since "identifier" and "unique identifier" are not the same, in my
> opinion "identifier" is still viable, if we explain that it is called
> identifier because the idea behind that field is to be used to identify
> the queue, but that there is in fact no requirement on selectivity let
> alone uniqueness.
> 
> 
> Regards,
> Halil 
> 

Well "identifier" seems to come from "identity" meaning "same" so I
think yes, it implies a 1:1 relationship.
And more importantly, it might not identify the queue, there is
in fact no requirement on how it is used at all.

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

