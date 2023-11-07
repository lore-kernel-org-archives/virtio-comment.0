Return-Path: <virtio-comment-return-8238-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783C9C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:43:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BE7AF2CAF7
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:43:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82D48986826
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:43:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6082B9867FB; Tue,  7 Nov 2023 10:43:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4FC539867FC
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 10:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 33F80tqOMtKoOel21GwKNQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353808; x=1699958608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGF1eyHrEQDXo7Kfkp6xWoxsT7bdFHVF4BAyuz1REE8=;
        b=uDTdvU+djsLRPwVJ5UtKdZ61HCMg5bREk48GIDXxyN7EFk/v38tm1EHMN6EUvJaHwZ
         AMw7V6fDHmIqYrxboxzuRc2wxCr4hbn7W01z/3hW/OPje/uimKQJeIoEgze1I1s2Ees9
         yiRni1y/T4bAAlbkqWW/zSbeScTyglQLNW4BJe7aakMwtQ5i6pL7F+/Qe+jp3IeHpjAv
         uNICU8xp8nHwGO3sCLxnJTJkMcTJ08u9JMvjO1T6cE3kSSbxxDVJUij18/m1LBkWgGGG
         25D903HTcsJbOINovy+RymKav3V/Fiuked6EqCbVYoVyr+WiSIUreYE3SuVHKdfwaQHQ
         VMRw==
X-Gm-Message-State: AOJu0YwFsF9f3g4xx0Cmg2/HnZZ2OOilc2T4ET8ShDreGr5gMGa+DYNb
	Ttqfh7cHnSA5G05nYlmYESskI+VtpzXOxouCxMlLFYy1YjmjT/oq2/VQkljBpOnqRX3k/HGygF0
	WVssrmknL3El3ihHM4pxVzPaOKTTiyvAoEg==
X-Received: by 2002:a7b:c051:0:b0:404:4b6f:d70d with SMTP id u17-20020a7bc051000000b004044b6fd70dmr2161313wmc.17.1699353808184;
        Tue, 07 Nov 2023 02:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzJMhA9M/L/itgIFYMCYmXrB/PLEeMINbvD/PGQnSVl8fxEV8fCRm9dlvFjcTIn/kaVC0Ctg==
X-Received: by 2002:a7b:c051:0:b0:404:4b6f:d70d with SMTP id u17-20020a7bc051000000b004044b6fd70dmr2161295wmc.17.1699353807715;
        Tue, 07 Nov 2023 02:43:27 -0800 (PST)
Date: Tue, 7 Nov 2023 05:43:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231107052534-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064352-mutt-send-email-mst@kernel.org>
 <378a54b3-1dd6-4626-95af-5485727923e2@intel.com>
 <6162be60-a539-4f42-89c1-edaaf90f3c45@intel.com>
 <20231106045022-mutt-send-email-mst@kernel.org>
 <67002d08-481e-40b6-8f23-05799b2b8f03@intel.com>
MIME-Version: 1.0
In-Reply-To: <67002d08-481e-40b6-8f23-05799b2b8f03@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking

On Tue, Nov 07, 2023 at 05:43:44PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 6:15 PM, Michael S. Tsirkin wrote:
> > On Mon, Nov 06, 2023 at 05:16:43PM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 11/3/2023 10:21 PM, Zhu, Lingshan wrote:
> > > > 
> > > > On 11/3/2023 6:46 PM, Michael S. Tsirkin wrote:
> > > > > On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
> > > > > > +\begin{lstlisting}
> > > > > > +struct virtio_pci_dity_page_track {
> > > > > > +        u8 enable;               /* Read-Write */
> > > > > > +        u8 gra_power;            /* Read-Write */
> > > > > > +        u8 reserved[2];
> > > > > > +        le32 {
> > > > > > +            pasid: 20;           /* Read-Write */
> > > > > > +            reserved: 12;
> > > > > > +        };
> > > > > > +        le64 bitmap_addr;        /* Read-Write */
> > > > > > +        le64 bitmap_length;      /* Read-Write */
> > > > > > +};
> > > > > > +\end{lstlisting}
> > > > > Okay, so it's a simple mailbox in config space.  Which by itself is
> > > > > probably a very reasonable idea - more or less what I suggested.
> > > > > However, using such a generic facility just for the dirty bitmap seems
> > > > > too limited.  Please make it accept arbitrary commands. Reusing admin
> > > > > command structure with a special "device itself" group sounds like one
> > > > > way to do it.
> > > > processing admin cmds in a cap may be too complex and overkill.
> > > > we need to handle variable length of cmds, handle async returned
> > > > results, and so on.
> > > > 
> > > > This struct seems easy and simple. And shall we use platform facilities
> > > > like vt-d
> > > > to track dirty pages?
> > > To demonstrate these issues, suppose we have a struct in a bar to process
> > > admin cmds:
> > > 
> > > struct virtio_admin_cmd {
> > >          u64 in_data_length;
> > >          u8 cmd_in_data[];
> > >          u64 out_data_length;
> > >          u8 cmd_out_data[];
> > >          u8 ret;
> > > };
> > An alternative is do same as you did here, e.g.:
> > struct virtio_admin_cmd {
> >           u64 admin_cmd_pa; /* an out descriptor followed by an in descriptor */
> PA depends on IOMMU and ATS

Not how virtio spec uses it. grep spec for physical address.


> >           u32 pasid : 20;
> > 	 u8 reserved : 11;
> > 	 u8 hardware : 1;
> > };
> > 
> > or we can stick two lengths and addresses straight in the capability.
> Still can only process only one cmd at a time and others are blocked.

Point being? Your patch is the same - thought you wanted simplicity?
We could stick a full queue there for sure - does this seem like
a good idea to you?

> > 
> > 
> > > The problems are:
> > > 1) command_in_data and command_out data have variable length, so how many HW
> > > resource should be reserved in the bar?
> > actually admin commands are truncated by device so just
> > set to length that device understands.
> How the framework know the length? How can the vendor know how many
> HW resource they should place here? I am not sure it is a good
> idea to guess.

I really don't want to repeat the whole admin command infrastructure
explanation I thought it's pretty clear. device knows the length
and truncates. Let's not get started on frameworks please.


> > 
> > > 2) To process the cmds in the bar, the device MAY need to read many
> > > registers in cmd_in_data[] and write many registers in cmd_out_data[],
> > > which can be ineffective, this is not DMA.
> > True. Again if you don't want to depend on pasid that's the
> > only option.
> Yes, this exactly shows how complex and overkill to use
> a cap to handle admin cmds. And maybe admin cmds is not a must.

I don't know. But this patch in question is really just impractical.
We can't implement silly one-off gateways for each new random thing.
You work on this thing so it looks like it's the most important feature
to you maybe, but virtio works very well for most people than you
very much.


> > 
> > 
> > > 3) a bar can only process one cmd at a time, and the driver can only issue
> > > another cmd after received an ret.
> > > This process has to be synchronous IO, one cmd blocks another.
> > Exactly same as what you did though.
> We have implemented a cap in PCI for dirty page tracking, there are no admin
> cmds.

"implemented" as in "posted v1 of a very rough draft". with tradeoffs
like increasing migration payload by a factor of x8. Or try to use
AtomicOps, if you try you will I believe see commands can actually
fail and so you need to report errors.

So maybe it's great for CXL. Should we be able to use platform
capabilities if there?  Of course. This is right in the charter.  Must
we limit ourselves to specific platforms with specific capabilities? if
there are tc members interested in supported limited platforms without
said capabilities, I don't see why we must.


> And for dirty page tracking, we still believe it is better to use platform
> facilities,
> as Jason explained.

So pls don't waste everyone's time trying to review stuff you don't think can work.


> > 
> > > 4) VF implementing a bar processing admin cmds conflicts with PF's admin vq.
> > So just don't create conflicts. It's same as multiple admin vqs
> > really which we already support.
> How to tell the SW don't create conflict?

It's like a single mutex in software or something no?
We already say 
	It is the responsibility of the driver to ensure
	strict request ordering for commands, because they will be
	consumed with no order constraints. 
seems enough for me.


> > 
> > 
> > > So I think a bar or a cap processing admin cmds is way to complex and
> > > overkill.
> > > 
> > > Thanks
> > Sounds like a straw man argument.
> > 


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

