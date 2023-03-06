Return-Path: <virtio-comment-return-4726-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2727DC6FD1B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 22:57:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 770D841EED
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 22:57:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65D339866C6
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 22:57:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5B73A9866BE; Mon,  6 Mar 2023 22:57:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48EB59866C0
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 22:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 07A5vMvQN9-ZKKvSIR6djw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678143430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EdQ/FEnCRLg+zMLHSEvk+TGzODD4tqf8B4U6kjam8w=;
        b=fucYa7d5JwyECV7oyLZjJ02c0XhONnwFBcxTTAaSQCTQGzSzNS3EwiEb+CJAP6n5V1
         CWlY4Dy8z/Dx+XfZnDnjcGgwDmzFE5VPjvXwJmtmYCzXAjDN8aBGC8h9MgtqjO731Mm9
         TOVPI0M6fKiuY+VWZRa2P2Auo1jOsSc13YO4C+8LuRCuvcZZmu27i8+WFANENJl1DO6C
         oo8H+IJoSybRVVfgfHtW61L6NDuvOgf28UGo8/qyIafz9vUtaOtYVKicwWmyMOc8mzsE
         IAgVyLWBP4+PXIapOAbKBdwYD/FxuOhlTnla7qcn30QqlJz4Y5nu1r80AvvdI1wvZuS/
         15CQ==
X-Gm-Message-State: AO0yUKVlDiVMuzGyBaHYc7jZ0wPs8XBLchv7VUEisSj+/wTt74DiCuLj
	pKo+37DU//pRBZmMCeR8zFmSfJ9XUTj3zneL5mULq0oFKDq/5yAGVKl6Ub4fGouOKrP6/MyOkfV
	denqmuV8OdWLe4hKqdiIYweQdUzqDmm0AZQ==
X-Received: by 2002:adf:fbc7:0:b0:2cc:4d13:908d with SMTP id d7-20020adffbc7000000b002cc4d13908dmr7689871wrs.11.1678143430484;
        Mon, 06 Mar 2023 14:57:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8S5U0aWES8g6zNNn2q2NYBO3ZOm+8Jwy8sq+bGUUu7oUpd44jz7ovrjqleZu7TpCzCMmfakA==
X-Received: by 2002:adf:fbc7:0:b0:2cc:4d13:908d with SMTP id d7-20020adffbc7000000b002cc4d13908dmr7689863wrs.11.1678143430196;
        Mon, 06 Mar 2023 14:57:10 -0800 (PST)
Date: Mon, 6 Mar 2023 17:57:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-dev@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jason Wang <jasowang@redhat.com>,
	virtio-comment@lists.oasis-open.org
Message-ID: <20230306175558-mutt-send-email-mst@kernel.org>
References: <20230301141027.59500-1-hengqi@linux.alibaba.com>
 <m2lekf1iq8.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <m2lekf1iq8.fsf@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v10] virtio-net: support the virtqueue
 coalescing moderation

On Thu, Mar 02, 2023 at 11:36:18AM +0000, David Edmondson wrote:
> > +                                        for an enabled transmit/receive virtqueue whose number is \field{vqn}.
> 
> Should this now be "whose index is \field{vqn}"?

Ugh.  I guess we'll have to fix the number/index mess in the spec
first. Parav you said you are looking into it?

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

