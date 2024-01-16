Return-Path: <virtio-comment-return-8959-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FC5C47077
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 13:29:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 75320157EEA
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 13:29:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 575B49865CD
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 13:29:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 429469865C8; Tue, 16 Jan 2024 13:29:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 355829865C9
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 13:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: z9ruRzXWNYSPKvPZ3Mkbmw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705411770; x=1706016570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5ojE/cbwa9T6o6evOlL8q7eQDFkFigNK1LZfOf1ukY=;
        b=MtHNLz2vXaDFws7G0Y0vIT3fvhDAHzci7ERRP55zW9bZd408RlbZ0nL0g+aCdFNBte
         +UMhJYtLwAm8TcxkAciJoehs0MNc5Y6RLetRbk21fNW4mrB5JXOSu64ejP3JhQbIyziD
         Ewdi/Ibi0WKu9/1tvR8bJOAVQfhaJIhbEYMz+Gclc+bqCDi54MWrlmaUsJ5Id+2XmExM
         IwLcHmKA/F2gFsJBCirrVDHaDID/WEgNQ4EV7uvEHxcjxCWp4z7ySITRjV6UEa68Mhqa
         ++K+lnSroprCq4p+Jc4gs5LLxuCb3VGkRdZdfKsq1XFVDSCzCBWEIFQjbqXeBN8FBE1E
         n0qA==
X-Gm-Message-State: AOJu0YyID40TgNh1bAzW2dZOo3DCe07cQL2LFZBnNsOQYUxEcCilzIht
	Kk34l83F9GsACisxtCiKkwU/zI/aDruKyLptb5ueN30c5FpL+mXF5/zk9Mxr5l6auIAmp9UMTuv
	J1k3XcdioQ1H0tWw+cN/Bl5gzEE/2rbGFF6BDowtb3w==
X-Received: by 2002:adf:ef88:0:b0:337:8f4f:9075 with SMTP id d8-20020adfef88000000b003378f4f9075mr2082091wro.7.1705411770682;
        Tue, 16 Jan 2024 05:29:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2fPe5JrvpMrw1rsHFDfv1V6M6oxUyBopZGt3M0s5F37AEfRLEDOT/KhCL/XEqxwqSi/yK5Q==
X-Received: by 2002:adf:ef88:0:b0:337:8f4f:9075 with SMTP id d8-20020adfef88000000b003378f4f9075mr2082088wro.7.1705411770332;
        Tue, 16 Jan 2024 05:29:30 -0800 (PST)
Date: Tue, 16 Jan 2024 08:29:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
Message-ID: <20240116082825-mutt-send-email-mst@kernel.org>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com>
 <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text

On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Tuesday, January 16, 2024 6:08 PM
> > To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.oasis-open.org;
> > mst@redhat.com
> > Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> > yuri.benditovich@daynix.com
> > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation text
> > 
> > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > 
> > >> From: Cornelia Huck <cohuck@redhat.com>
> > >> Sent: Tuesday, January 16, 2024 4:33 PM
> > >> To: Parav Pandit <parav@nvidia.com>;
> > >> virtio-comment@lists.oasis-open.org;
> > >> mst@redhat.com
> > >> Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> > >> yuri.benditovich@daynix.com
> > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> > >> calculation text
> > >>
> > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > >>
> > >> >> From: Cornelia Huck <cohuck@redhat.com>
> > >> >> Sent: Monday, January 15, 2024 10:14 PM
> > >> >
> > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> > >> >> > +The driver MUST consider size of field \field{struct
> > >> >> > +virtio_net_hdr}
> > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12
> > >> >> > +bytes if
> > >> >> not.
> > >> >> > +
> > >> >>
> > >> >> Requiring the driver to consider the size of something to be its
> > >> >> actual size seems a bit odd :) I don't think we need this, as the
> > >> >> length can be derived from looking at the definitions, and is
> > >> >> already spelled out explicitly, if you consider my suggestion above.
> > >> > We need this because tx side also needs to refer to the
> > >> > virtio_net_hdr in
> > >> patch 2 to be same as that of the rx side.
> > >> > And hence, this normative sets base line for tx side too. Relying
> > >> > on rest of the
> > >> receive packet normative is not enough.
> > >>
> > >> Hm, why? If struct virtio_net_hdr is well-defined, its size is
> > >> well-defined as well, and we do not need to state it explictly?
> > > Because,
> > > the size of virtio_net_hdr is derived from the rx side features.
> > > Today there is no normative line that says that even though you are using A,
> > B, C Rx features, due to which your tx side virtio_net_hdr also changes.
> > > The 2nd patch in this series adds this explicit normative as explained in the
> > cover letter.
> > 
> > Let's step back a bit.
> > 
> > struct virtio_net_hdr is defined at the beginning of the "Device Operation"
> > section; the definition clearly says that the last three fields depend on
> > VIRTIO_NET_F_HASH_REPORT being negotiated. The device and the driver
> > agree on whether HASH_REPORT is negotiated, and therefore should also
> > agree on the size of virtio_net_hdr?
> > 
> Do you imply that device operation description is enough to not add normative?
> If so, for this case and possibly new things if we write as device operation, would it be enough?
> 
> > Or is the problem that we did not state explicitly that the last three fields of
> > virtio_net_hdr do not exist without HASH_REPORT (and are not merely
> > invalid)? If yes, we should spell this out, instead of adding normative
> > statements about what the size of virtio_net_hdr should be considered to be.
> This suggested normative is added in this patch.
> 
> > If virtio_net_hdr has a fixed size, we shouldn't need the second patch, either.
> The fact that HASH_REPORT is only for the rx, if we have to go back in time, there is no need for the tx to force also to follow the rx virtio_net_hdr.
> There is no explicit normative indicating the virtio_net_hdr for the TX is forced by the RX even though it has no relation to hash report.
> 
> If you say device operation is enough, than I am sort of lost of when normative is needed, and when device operation is enough.


Generally we start adding normatives when we see that something is
unclear. But I think generally I agree with Parav, if someone has
the time to write the normative, it's all good.

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

