Return-Path: <virtio-comment-return-6625-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F54EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 21:45:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4CA8A71CB3
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 21:45:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 452489866ED
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 21:45:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B963986677; Thu, 29 Jun 2023 21:45:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 271AC9866E7
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jun 2023 21:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: k_Q-uHJcNnqN9w17BrRazw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688075150; x=1690667150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABJ/ENovWQ9lXDTK1wb0snT5cMR3gtOt5/Wair1MiiA=;
        b=j8RvWEHlLNiZxdHlxAjV2OX3XNPk/XcvfdmzzrIOEhKuUtmEcjyQ+PTVmJzdTOYcMz
         h1IJGeBGuHXvxhPizNowfo/aG1xvHzVBsGx4edg52/xxGwoZDsT7csjh+3HBSKU0szTb
         ss4/eFgUaxH0EX5nTD5TjOj5W7X3jotRgG4mYWj14rUSKFNSlMh3yqxtVDyygZPVArTR
         gKkvPdFPhrYRO9wplB7qq2fXd0ZhU4turfMejEAPC9LWTru7GOC6xXpRp8CWdme4Dzg3
         9MVaEmulDUR+72rV+wRD2AqbcyfPp2FkFZQS+GztQzbWDJDxCCmKCaOIdn5qWHRXHYp1
         6D/A==
X-Gm-Message-State: ABy/qLamPLIzZkEO+BSz8rG1Fvxf7hJ3j/zPBOs0anvd3MbMj3POmt86
	zW/DQF4SQ2UsWbaCOfg77nXZsfUe3dCe7osYn7VCD4WemsWuo8TyrqHh+PKHXXb0tNe5NkZztah
	uzgEfECY87nR6uXIfHolReiJi8zG6R22bnA==
X-Received: by 2002:a5d:6581:0:b0:313:f463:9d40 with SMTP id q1-20020a5d6581000000b00313f4639d40mr497698wru.65.1688075150793;
        Thu, 29 Jun 2023 14:45:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEveRmxTSfhf81ZZ6JwRyj59V/zOUVAYAttaGqMGKTq1DaBunAK+VoiHnZMnhwiSUpm2iZUoQ==
X-Received: by 2002:a5d:6581:0:b0:313:f463:9d40 with SMTP id q1-20020a5d6581000000b00313f4639d40mr497681wru.65.1688075150435;
        Thu, 29 Jun 2023 14:45:50 -0700 (PDT)
Date: Thu, 29 Jun 2023 17:45:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230629174443-mutt-send-email-mst@kernel.org>
References: <20230627211050.1527507-1-parav@nvidia.com>
 <20230627211050.1527507-4-parav@nvidia.com>
 <20230629154634-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E7610F4941C615617CA0DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E7610F4941C615617CA0DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 3/4] admin: Add group member legacy register access
 commands

On Thu, Jun 29, 2023 at 09:32:21PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 29, 2023 3:50 PM
> 
> > > +When command completes successfully, \field{command_specific_result}
> > > +uses following structure:
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_legacy_notify_query_entry {
> > > +        u8 region[8];
> > > +};
> > 
> > This confuses more than it clarifies.  Do this:
> > 
> I rename region to region_data and link for the transport.
> Mostly implementer will directly jump after learning this theory of operation so, it should be ok to list in pci.
> 
> > struct virtio_admin_cmd_legacy_notify_query_entry {
> > 	union {
> > 		virtio_pci_notify_region region;
> > 	};
> > };
> > 
> Yes, I thought about it, but it was pci transport listing so kept it generic.
> More below.
> 
> > 
> > > +
> > > +struct virtio_admin_cmd_legacy_notify_query_result {
> > > +	struct virtio_virtio_admin_cmd_legacy_notify_query_entry entries[];
> > > +}; \end{lstlisting}
> > > +
> > > +The driver should pick the suitable entry when multiple entries are
> > > +supplied by the device.
> > > +
> > > +Refer to the specific transport section for the definition of the
> > > +\field{region}.
> > 
> > Where? How does user know where to look?  Add a link.
> >
> Will add the link.
>  
> > 
> > Or preferably I would just include that tex right here to avoid the need to jump
> > back and forth.
> > 
> We have vq notify config data as generic and transport specific listing,

But note how that is included directly in multiple places -
not a link. In the resulting PDF it appears inline.

> So will improve this part of text with link.

anyway, that's not part of ABI.


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

