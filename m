Return-Path: <virtio-comment-return-4906-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A24C6FD1F
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Mar 2023 07:36:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6CF8E56DC
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Mar 2023 07:36:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 55F11986428
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Mar 2023 07:36:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 431C69841AC; Thu, 16 Mar 2023 07:36:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C20798641F
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Mar 2023 07:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1F3NRlf2PNGc1uUG3yLe0g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678952191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI6jozccRNTHy1FCZotERV3/xeZyNfCIeHyd0iw4un8=;
        b=D0bbsGoHwoFORPII0MaQdiRbiIlnsvvas9Qt8SzKTqgAhtk5vRl0GPfD8EgS1Vyadm
         Q3cNV0VeTAk/Nx9KwXAJyJDpFZJfB/UoUjn6S1eegze2xq1D6NeiEDwzmJo7GGM2zivp
         mAo+hR2rAUsnikB0G5m4ZOU1SixYS+duUI2fV+O2YMkeQdzhDwtzpEWHq6lWvY51byef
         ZRm+yKN+hYvJQSmt2eJVJG6dP5s626MjwM8HmOELDBc0MIQio9x+6NWcj8s1NgNzjrOC
         91cooFtY0zbQVJ9/50PN6OPK0C+VaWEuZGV3JayRN83DpTRiFQQyXy2H0NnDR4OZHesv
         oQCQ==
X-Gm-Message-State: AO0yUKXd+lgAAIaA450g2Q453B5x7lqoPbA94OKj7ojA6e+1IFLX86gl
	v2urZnNRTH5YmUQHFWlclTa5fsucWbe3uYEBYg/ZWTD2F8oW3DuouR+QBKkI+NyaZ6WpAm51pkD
	w6uc3X9iDxJYUsnDeYOZVAQ4NLPm9E+oJgg==
X-Received: by 2002:a05:600c:4f0e:b0:3ed:3fe9:447a with SMTP id l14-20020a05600c4f0e00b003ed3fe9447amr2792339wmq.26.1678952191522;
        Thu, 16 Mar 2023 00:36:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set81ys3aOTNWKxVW5F7wUtEjNRy+Vr3saf5i/rqregl24N9xnq9ReaNlc3L0hoZxv2rOxvXTtg==
X-Received: by 2002:a05:600c:4f0e:b0:3ed:3fe9:447a with SMTP id l14-20020a05600c4f0e00b003ed3fe9447amr2792318wmq.26.1678952191190;
        Thu, 16 Mar 2023 00:36:31 -0700 (PDT)
Date: Thu, 16 Mar 2023 03:36:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230316033526-mutt-send-email-mst@kernel.org>
References: <20230306154817.14115-1-hengqi@linux.alibaba.com>
 <c81de233-227c-73c8-a4bd-d43aa374dd86@nvidia.com>
 <20230315075954-mutt-send-email-mst@kernel.org>
 <11cce86e-8068-2e83-9fc5-e1b825adde29@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <11cce86e-8068-2e83-9fc5-e1b825adde29@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v10] virtio-net: support inner
 header hash

On Wed, Mar 15, 2023 at 07:24:57PM -0400, Parav Pandit wrote:
> > So what's left, GRE?  GRE is actually different, in that it's not IP at
> > all.
> Sorry, I wrongly wrote nvegre above.
> 
> IPoIP, GRE and NVGRE are left.
> 
> vxlan and geneve has the udp src entropy.
> 
> > 
> Not sure I understand "its not IP at all".
> 

GRE header is distinct from IP header and has its own flow ID.



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

