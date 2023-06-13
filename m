Return-Path: <virtio-comment-return-6321-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A039CC7EE29
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 08:57:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C3A29C6225
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 08:57:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B855998657E
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 08:57:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A21D198653E; Tue, 13 Jun 2023 08:57:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E59E986542
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 08:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -Qx8VzqEMy2jc4O3ydGnog-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646665; x=1689238665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGi8T9jJddSh/uXoKavZy/ZVX8Czbmn/Jk4nVSbGZtA=;
        b=AOM7GxeBqnDRnX3Hm0chQIzNXrrJz1JM7kiZXtXIPZZJIQXg+xrJGRjI59vRP4Y042
         nfLyy7iHz9ZV9kS3yVpke0+RAR+WftJog9M9XB/6HNca+svGN0RHLfvBlmMWbHnRUc5k
         aXRWyfdTNYyAgTdtQJj8DAuBoT9brVWjZQ5hkigZHbocmKLVEzRtlZtxBW98MRsrMXwe
         Lf+T9bJD0ow96tDDNYQYJ/6yVa3dHImrsLlfN96jDWqlOYcZboXTQW7wSgmIDiDwsuOn
         5xY+qzZeGUZ4k2ET120Ra0W0SDOsQjYJWIr/DJmV/MK00XBJTYMlNHpYHy+h+B5uJyh2
         XKrA==
X-Gm-Message-State: AC+VfDz33RvEp8iwvqvR2F0qA7xftPsdhAajvRmQvbHvbXFEDpMKbBhb
	/+Z46GrKz2gtO3SbrdEVFsVxLiyGY2OMVKFtDuI2KURyyGY+Q0OqbtqxlzIDFu5WiRgOVNQsCS3
	QS+ENNEo0nXwNlJ9QRngD2Ef6GaQKmiBUfA==
X-Received: by 2002:a17:907:608a:b0:968:c3b5:8b92 with SMTP id ht10-20020a170907608a00b00968c3b58b92mr12213565ejc.57.1686646665187;
        Tue, 13 Jun 2023 01:57:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hXCpwXi966lLvFCMN0ygV38SCZ2cNikrrC8v39w61ORiD+iTd3+sYgBDAML7B3YazdiZqhA==
X-Received: by 2002:a17:907:608a:b0:968:c3b5:8b92 with SMTP id ht10-20020a170907608a00b00968c3b58b92mr12213558ejc.57.1686646664919;
        Tue, 13 Jun 2023 01:57:44 -0700 (PDT)
Date: Tue, 13 Jun 2023 04:57:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jason Wang <jasowang@redhat.com>
Message-ID: <20230613045211-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
 <20230606120830.GA28580@h68b04307.sqa.eu95>
 <PH0PR12MB5481FEE6DF87BCF2D44BF311DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c6609edb-5493-7470-4d56-df92c7a1715c@linux.alibaba.com>
 <PH0PR12MB548129A5BC4DDF5A9B986E8CDC54A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548129A5BC4DDF5A9B986E8CDC54A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements

On Mon, Jun 12, 2023 at 05:26:04PM +0000, Parav Pandit wrote:
> 
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Monday, June 12, 2023 10:35 AM
> 
> > > I will update this details in the v1.
> > 
> > Hi, Parav.
> > 
> > Do we have a work schedule for the 1.4 features?
> 
> Since n-tuple requirements are straightforward, below is timeline in mind,
> 1. Requirements agree and drafted by June-30

Pls note a bunch of people are traveling to kvm forum,
I'd add a couple of weeks.

> 2. Design and its review to finish by July-30
> 3. Spec to review by Aug-30

Wait a second are we talking about 1.4 or 1.3?  For 1.3 indeed we need
to wrap development up by end of summer - our charter is to produce
releases every 12 to 16 months, previous one was July 1st, 2022.

> > For example, the flow director we are very concerned about recently, because
> > different scenarios have requirements for it.
> > 
> > We'd like to work out with you a rough timeline so we can discuss and
> > collaborate better!
> > 
> Will above timeline workable for you to work together on it?
> We should work on finite requirements that we can converge and deliver.
> First draft was this v0 one.
> 
> Otherwise, it can be never ending list that doesn't reach anywhere as steering technology keeps improving.
> 
> Slightly unrelated to question, let's call this feature as: "receive flow filters", instead of "flow director".
> 


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

