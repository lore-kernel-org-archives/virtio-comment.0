Return-Path: <virtio-comment-return-4965-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04748C6FD1F
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 03:46:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 37D702AC9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 03:46:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DFAB986460
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 03:46:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2452598643D; Wed, 22 Mar 2023 03:46:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1154B986447
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Mar 2023 03:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uG6MJGQpNh6u6HsJa1bxaQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679456775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/do8mCN3Y9E4UpAYjid+Q3D8f6BVtSUDtqi3CwFdn38=;
        b=zruWMf8c9dXSY8LVcXFMBZa8JhqQwU9qvJmKC6fvtbbfU73/FVYTODBRzK9zTKUhoQ
         00UGcI8qoNJ5e2Z4+kum+J3h83AbHk7jEd264WnwOFiaTmCsiyO8L91y5k6fOS0v6McI
         icvcCnvrJ4EoL/Q8KnccmditQEg/3K9OnpFc8fPWFhtG6fAL4/08PpEybL5FSsr3ttYF
         lcUKSPat30WFjHX8vaP01Sd6Ca62y7AsTUkVbrbrp9KAz9hZofWyF0KNeEJoBYfheA/3
         cAXUqMT035Y8yjq1aefYksae5mZNJTqJh/MIVVjhMq23uerFAhpRiWH+UnrMYkzIFqWm
         F1Cw==
X-Gm-Message-State: AO0yUKXVEpgTtxr/tzIYROrBILTEZw+ogQDydXZU81rgDIeognNeEBn7
	UNyBp5nx1CwYuWyueDo2i9OfM4YNbbslJQ2yt040Cm/pORKWysAyGUWMZL7qoqoqr4hNwF+ycLb
	+qMm5FMyJScFzgnwh2IStbnGrruOG3tKHvw==
X-Received: by 2002:a05:600c:2313:b0:3ed:90b2:60c6 with SMTP id 19-20020a05600c231300b003ed90b260c6mr3927448wmo.19.1679456775677;
        Tue, 21 Mar 2023 20:46:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set/AdaVFyidmaSHhmtxXpOFJoPeSBms23pzvTcg5yqyZWPfT65HlVFKTJEBvVc00nKMu8i5VKQ==
X-Received: by 2002:a05:600c:2313:b0:3ed:90b2:60c6 with SMTP id 19-20020a05600c231300b003ed90b260c6mr3927436wmo.19.1679456775364;
        Tue, 21 Mar 2023 20:46:15 -0700 (PDT)
Date: Tue, 21 Mar 2023 23:46:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230321233616-mutt-send-email-mst@kernel.org>
References: <20230321215834.225856-1-parav@nvidia.com>
 <20230321215834.225856-9-parav@nvidia.com>
 <20230321180052-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DD9C8A5D0B1B14A3B184DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481DD9C8A5D0B1B14A3B184DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 8/8] virtio-net: Describe RSS using receive queue
 handle

On Wed, Mar 22, 2023 at 02:37:48AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, March 21, 2023 6:17 PM
> 
> > > -Field \field{unclassified_queue} contains the 0-based index of -the
> > > receive virtqueue to place unclassified packets in. Index 0 corresponds to
> > receiveq1.
> > > +\begin{lstlisting}
> > > +le16 rq_handle;
> > > +\end{lstlisting}
> > > +
> > > +\field{rq_handle} is a receive virtqueue handle. It is calculated as
> > > +virtqueue number divided by two. For example a receive virtqueue
> > > +handle value of 3 corresponds to virtqueue number 6 maps to receiveq4.
> > > +
> > > +Field \field{unclassified_queue} contains the receive queue handle
> > > +\field{rq_handle} described above.
> > 
> > You dropped *which* queue this refers to.
> >
> Will add back.
>  
> > And it's still kind of complex and non-standard. E.g. what does \begin{lstlisting}
> > le16 rq_handle;
> > \end{lstlisting}
> > mean exactly? Apparently nothing ...
> > 
> Why nothing, it is referenced further down.
> Did you suggest moving before using it?
> It was just fine to provide forward reference.

because it does not say anything about the contents or the format. just some kind
of integer.

> > I feel what we keep there is really the virtqueue number itself.
> > Just stored in this strage format.
> >
> > And all this talk about handles kind of seems to add yet another term to learn.
> > Where in fact all it is, is just a different way to store vqn.
> > 
> > So my idea was this: we say something like:
> > 
> > 
> > \field{unclassified_queue} contains the virtqueue number of the receive queue
> > to place unclassified packets in.
> > \field{indirection_table} contains an array of virtqueue numbers of receive
> > queues.
> >
> Above two lines are clearly confusing where virtqueue number describe in rest of the spec and above doesn't align to same notion.

That's true.

> So better to say field A contains the rq_handle and
> 
> struct rq_handle {
> 	le16 vqn_16_1: 15;
> 	le16 reserved : 1;
> };



>  
> > Both \field{unclassified_queue} and \field{indirection_table} use the following
> > format for the virtqueue numbers:
> > \begin{lstlisting}
> > struct rss_virtqueue_number {
> It is really not any superior in term of cost of learning.
> 
> > 	le16 vqn_16_1 : 15; /* Bits 16 to 1 of the virtqueue number */
> > 	le16 reserved : 1; /* Set to 0 */
> I like the structure and reserved bit that enables to claim one bit for some unknown future use.
> > }
> > \end{lstlisting}
> > for example, a value of 3 corresponds to virtqueue number 6 and maps to
> > receiveq4.
> > 
> > 
> > 
> > and then everywhere else we just say it keeps a vq number, we already
> > explained it is using this format once no need to repeat that.
> >
> I just prefer to rename it to rq_handle ( or at least other than virtqueue number) to distinguish it from rest of the virtqueue number.

Well first of all I really want to make it clear it's specific to
RSS at least for now. So let's prefix with rss_.
Maybe I'm wrong but I feel using up a completely
new term for something very specific to RSS is a waste.
We won't be able to use handle for something else without confusion.
So how about just

	struct rss_rq {
		le16 vqn_16_1 : 15; /* Bits 16 to 1 of the virtqueue number */
		le16 reserved : 1; /* Set to 0 */
	};

hmm?



> > WDYT?


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

