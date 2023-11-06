Return-Path: <virtio-comment-return-8200-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0267FC4167D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:15:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3825F44551
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:15:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 117BC98672E
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:15:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EA2FA986717; Mon,  6 Nov 2023 10:15:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DAF43986718
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 10:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: g8EkCWWQMi6RGu94XUIakw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699265737; x=1699870537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=za4pxzMc5AhcjWDNg3Xmr8GGLB6GOjuUTDe0N/gqfjU=;
        b=YwZWx1LgVkifcXtJsdh/hok3aLU4RrtL/trfauhU8lPYpA4uxoxEp26xivsUiTz0tZ
         X/IfmJ/xASICxDWIEls9qMQkV0gddkthaV26c/Y7exa+YL1nFbo3YA2wDDb6BQktftjp
         hv4ABxAj+s58gPN/KTp3WQNoylEeygPq+1f2TeLlrV7TYvhq9CUFQlTl57XJV2w/iIge
         b8ORt2MzttHLnzDaXRfxkzIi7Ov42+7u7QjtHOToOW1HoaHtso710jW6ICIYWihOQ1JV
         KVV+AHp5rtt3JzLNnj8FOQnYWIM1+2LJVg5dPl1Aw5sgHR/fw6iNuIEOy4bKD5AYObmi
         bWNg==
X-Gm-Message-State: AOJu0YxFEOaxFnYcJZ69NNYudCJxQtVlXtnsGFnOLg+L54kwyvsg0AzE
	fkLu4Rr989CSWpN19FO96ROo6Vzm+jvh1tU4hx5557a8qMeleiL1RpLe50GlQfMaUEmDJplou0B
	xdVZ4rqt4Hv1OhrCsu3ndIJWo4FLikW5xWQ==
X-Received: by 2002:a05:600c:4e94:b0:408:febf:831f with SMTP id f20-20020a05600c4e9400b00408febf831fmr22927235wmq.28.1699265737291;
        Mon, 06 Nov 2023 02:15:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQoERnrMojIdMJpDFZUPKlq+HIfI2HoPzgqGaud2ls3qBUlqnKUdtpGU6XCV2HRDLib9th+A==
X-Received: by 2002:a05:600c:4e94:b0:408:febf:831f with SMTP id f20-20020a05600c4e9400b00408febf831fmr22927219wmq.28.1699265736960;
        Mon, 06 Nov 2023 02:15:36 -0800 (PST)
Date: Mon, 6 Nov 2023 05:15:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231106045022-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064352-mutt-send-email-mst@kernel.org>
 <378a54b3-1dd6-4626-95af-5485727923e2@intel.com>
 <6162be60-a539-4f42-89c1-edaaf90f3c45@intel.com>
MIME-Version: 1.0
In-Reply-To: <6162be60-a539-4f42-89c1-edaaf90f3c45@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Mon, Nov 06, 2023 at 05:16:43PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/3/2023 10:21 PM, Zhu, Lingshan wrote:
> > 
> > 
> > On 11/3/2023 6:46 PM, Michael S. Tsirkin wrote:
> > > On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
> > > > +\begin{lstlisting}
> > > > +struct virtio_pci_dity_page_track {
> > > > +        u8 enable;               /* Read-Write */
> > > > +        u8 gra_power;            /* Read-Write */
> > > > +        u8 reserved[2];
> > > > +        le32 {
> > > > +            pasid: 20;           /* Read-Write */
> > > > +            reserved: 12;
> > > > +        };
> > > > +        le64 bitmap_addr;        /* Read-Write */
> > > > +        le64 bitmap_length;      /* Read-Write */
> > > > +};
> > > > +\end{lstlisting}
> > > Okay, so it's a simple mailbox in config space.  Which by itself is
> > > probably a very reasonable idea - more or less what I suggested.
> > > However, using such a generic facility just for the dirty bitmap seems
> > > too limited.  Please make it accept arbitrary commands. Reusing admin
> > > command structure with a special "device itself" group sounds like one
> > > way to do it.
> > processing admin cmds in a cap may be too complex and overkill.
> > we need to handle variable length of cmds, handle async returned
> > results, and so on.
> > 
> > This struct seems easy and simple. And shall we use platform facilities
> > like vt-d
> > to track dirty pages?
> To demonstrate these issues, suppose we have a struct in a bar to process
> admin cmds:
> 
> struct virtio_admin_cmd {
>         u64 in_data_length;
>         u8 cmd_in_data[];
>         u64 out_data_length;
>         u8 cmd_out_data[];
>         u8 ret;
> };

An alternative is do same as you did here, e.g.:
struct virtio_admin_cmd {
         u64 admin_cmd_pa; /* an out descriptor followed by an in descriptor */
         u32 pasid : 20;
	 u8 reserved : 11;
	 u8 hardware : 1;
};

or we can stick two lengths and addresses straight in the capability.


> The problems are:
> 1) command_in_data and command_out data have variable length, so how many HW
> resource should be reserved in the bar?

actually admin commands are truncated by device so just
set to length that device understands.

> 2) To process the cmds in the bar, the device MAY need to read many
> registers in cmd_in_data[] and write many registers in cmd_out_data[],
> which can be ineffective, this is not DMA.

True. Again if you don't want to depend on pasid that's the
only option.


> 3) a bar can only process one cmd at a time, and the driver can only issue
> another cmd after received an ret.
> This process has to be synchronous IO, one cmd blocks another.

Exactly same as what you did though.

> 4) VF implementing a bar processing admin cmds conflicts with PF's admin vq.

So just don't create conflicts. It's same as multiple admin vqs
really which we already support.


> 
> So I think a bar or a cap processing admin cmds is way to complex and
> overkill.
> 
> Thanks

Sounds like a straw man argument.

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

