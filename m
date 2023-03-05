Return-Path: <virtio-comment-return-4682-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E7C6FA8E
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Mar 2023 09:52:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8E609C622D
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Mar 2023 09:52:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8004E986436
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Mar 2023 09:52:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 78C1798638B; Sun,  5 Mar 2023 09:52:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 68A98986395
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Mar 2023 09:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: C29MHgZbPIenRVNyqxt3NQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678009918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wG6/1zGawaKNDlMomaUl0ZeJ4VFpPMtvBYG+dbvPJzw=;
        b=BGvPwp9fsQq0yBOmJ36mwjJP4Ft2LiXwptZkFIATS07AR+ciK/+PfhH3BshoPuzbLU
         pK2tUayenBsyZ7fSJ/UEFu6RTQFLVf1aDwGdJFdxRtNuyJO9KAqQboq8I6bRJrD2hg49
         LkiHzc5Wl6gOzazzMxVar9474ud5OK2vr7qC6xluY0VpilbUsprka/gusIwcA5c2qAYg
         u4wRboHG1WyPkvEEsILg8ifHHkBdlsiq1uOaSzfMjJWw0OWeZhDOe6PKmYrDTEz5Auzm
         wy7oiaweEMTJVYvWHjx0YlfBO/yf3C76GRnqrQZe/77WaAhH7205XMbgn8MJEnN6erav
         /fRQ==
X-Gm-Message-State: AO0yUKWjP52fOjLDxi1DJkMQLz+qkSkwRsXZh1DIljHGqWLYLFAPMFoJ
	TIvCi/+WU2KkqndYEOS5RQxjA5rUun+TsVf6kCDS3+ey8TN1mXKDbTgqVFBRt//TZ4Qhm8tdh0g
	2R3pHcj/cYPjTBC9vvz0eq+oBeOkYohFKKbupJLHLhw==
X-Received: by 2002:adf:fc4f:0:b0:2ce:5056:7220 with SMTP id e15-20020adffc4f000000b002ce50567220mr2297929wrs.51.1678009918744;
        Sun, 05 Mar 2023 01:51:58 -0800 (PST)
X-Google-Smtp-Source: AK7set98FUfjhupZTHnFsw4q1KjqwcPXxN3Huadmrz6YldsWgMs5k1rQcfx1U+q7uuOvlVOPbMhCKg==
X-Received: by 2002:adf:fc4f:0:b0:2ce:5056:7220 with SMTP id e15-20020adffc4f000000b002ce50567220mr2297918wrs.51.1678009918419;
        Sun, 05 Mar 2023 01:51:58 -0800 (PST)
Date: Sun, 5 Mar 2023 04:51:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230305043948-mutt-send-email-mst@kernel.org>
References: <20230223054624.168042-1-parav@nvidia.com>
 <87a60z5wes.fsf@redhat.com>
 <20230301182207.23f995cd.pasic@linux.ibm.com>
 <20230301123044-mutt-send-email-mst@kernel.org>
 <87a60vmbub.fsf@redhat.com>
 <20230303023949-mutt-send-email-mst@kernel.org>
 <20230303224937.62fe64b9.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230303224937.62fe64b9.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re: [PATCH 0/3] Rename queue
 index to queue number

On Fri, Mar 03, 2023 at 10:49:37PM +0100, Halil Pasic wrote:
> On Fri, 3 Mar 2023 02:42:49 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > > >
> > > > And then for extra fun, in the RSS section we say "0 based index" where we
> > > > seem to mean "this number in the queue name, but subtract 1 in your head".
> > > > Why subtract 1? I guess we wanted these 5 year olds to practice math ...  
> > > 
> > > Heh :)
> > > 
> > > Yeah, that looks like a mess... I don't think we should use a weird
> > > substraction scheme. I haven't looked at the RSS stuff much, would it be
> > > hard to fix it up?  
> > 
> > We can't change the ABI, I guess we can say that it's bits 1 to 15
> > of the VQ number or equivalently VQ number divided
> > by 2 (it's always an even number for any receiveq).
> 
> I don't think it would require an ABI change. We could just change the
> queue names. AFAIK those are not part of the ABI. I don't think it would
> be hard.

Well at the moment this is the mapping:

RSS index -  queue name - virtio pci vqn

0		receiveq1	0
1		receiveq2	2
2		receiveq3	4
3		receiveq4	6




> BTW what speaks for "VQ number" over "VQ index"?
> 
> Regards,
> Halil

We use "vq index" when referring to queue_select.

But, we use "vq number" when talking about notifications.

For fun MMIO calls the queue size field QueueNum


So both number and index are taken by things other than the number,
changing the meaning can confuse existing users.  Ideally we'd use some
other new term to avoid confusion but I could not come up with one so
far.  I feel there's less of a chance of a confusion between VQ size and
its number. But it's not a strong prefrence, RSS is relatively young
and it's the only incompatible user of index so far.


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

