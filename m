Return-Path: <virtio-comment-return-5727-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F53DC77B75
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:50:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B0EBFEEA0C
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:50:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A49429866B3
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:50:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 98B4898658B; Wed,  3 May 2023 16:50:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BB2B986594
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 16:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yT0Ceo8pP7OxrX961NWNxA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683132547; x=1685724547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83J5olkvNZ90NPBJJv/zidBuL5Kc5hBlrkCDoVn7Iog=;
        b=eYL3ABAQkk9CwbT1ky4HEidXWcYL47pqQVdUo/Aiq0E5gqOicY3rBw/QM8N/Rb/khH
         PShxyUvYo7vG49nHuRL2CH5QejfB9NeXdIo0JRN1eLlbxxVpSRzZifjAxGDzEkdmQD6j
         cFKOou7HgZg8KKOCGilg1P7dsZ9Ecg2lQLLI5+/CzOi/eVh8/7M1tVXmgPQfNJPng7b8
         UEgkNRy+VWzxi3vVzcgEnM8W0eGgiWGCPGcwsgBO16/h0CHuARLttLeAUjn5M/22AlBV
         ynwOPJg4iNNFviNAwNEdMeStDTXgxZN2a/6y/DzcTPqFvKfEHtb5zKA2oATo3tkSTk0L
         2vaA==
X-Gm-Message-State: AC+VfDyoxV+ag3IPELcveObWxx3wvCf8W7sfbav35k7czWyNhmK1PKJ/
	u4gSVcuw3gpQMidrFQa75mfusECxvB0UFCEuCC9JvHeB5vW3MK8gjMBoM6am4YONkR0yUnk+fhg
	4gVb3F2sFIUSunZC7Nm/BX1Exh9UYpA5uaQ==
X-Received: by 2002:a1c:7405:0:b0:3f1:7129:6b25 with SMTP id p5-20020a1c7405000000b003f171296b25mr14867987wmc.18.1683132547267;
        Wed, 03 May 2023 09:49:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58chPPA4OD63t1hswVXd7XRwSNEydQH0F+So0nIXNojC9At4sCdlqPaXerIdvbeQYExwjdSw==
X-Received: by 2002:a1c:7405:0:b0:3f1:7129:6b25 with SMTP id p5-20020a1c7405000000b003f171296b25mr14867978wmc.18.1683132546975;
        Wed, 03 May 2023 09:49:06 -0700 (PDT)
Date: Wed, 3 May 2023 12:49:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230503124848-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-2-parav@nvidia.com>
 <20230503014838-mutt-send-email-mst@kernel.org>
 <36e8746e-9edd-7998-3381-9cee2457f3df@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <36e8746e-9edd-7998-3381-9cee2457f3df@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 1/2] transport-pci: Introduce legacy registers access
 commands

On Wed, May 03, 2023 at 10:49:14AM -0400, Parav Pandit wrote:
> 
> 
> On 5/3/2023 1:50 AM, Michael S. Tsirkin wrote:
> > On Wed, May 03, 2023 at 06:26:58AM +0300, Parav Pandit wrote:
> 
> > > +Legacy registers write admin command follows \field{struct virtio_admin_cmd}.
> > > +This command writes legacy registers of a member VF device. Driver should write
> > > +appropriate register \field{size} depending on the width of the legacy
> > > +common registers or device specific registers.
> > > +Driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LREG_WRITE.
> > > +Driver sets \field{group_type} to 1 for VFs.
> > > +Driver sets \field{group_member_id} to a valid VF number.
> > > +
> > > +The \field{command_specific_data} has following listed structure format:
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_lreg_wr_data {
> > > +	u8 offset; /* Starting byte offset of the register(s) to write */
> > > +	u8 size; /* Number of bytes to write into the register. */
> > > +	u8 register[];
> > 
> > And maybe add
> > 	u8 reserved[]; /* structure padding to multiple of 8 bytes */
> > 
> > > +};
> Thinking, what do we miss without the padding here?

it's not 100% clear where the padding is.


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

