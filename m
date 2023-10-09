Return-Path: <virtio-comment-return-7634-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E0E95A91
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 15:55:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4F1AE120D46
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 15:55:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 35E67986542
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 15:55:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 209679864D3; Mon,  9 Oct 2023 15:55:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 126C09864F0
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 15:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QJNCoSCePrObzjNN2UhtdQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696866887; x=1697471687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6IoqqybwKBkoPDN6VVx6N3zm/+ekAioogjmXsCqrik=;
        b=qAZr3o1aosyKHyeKZqDR0aRRxQbhO9utfaW5cSnb+tMEvzhAqe6d/tEd4VUZOc0ocd
         HPCd3oOAoG0QkaORliCaEe53e2tIjQQl4NEiFj+bQqOllsUsJ0p3HECmlMCe+axE080P
         Uf2yATK8Ccab9r1ILqbSXcLRrnt3u2s+VMsNIJapJKz8uoxTwTT5snIEhgG8ckWOT3//
         bkMgK537Vkxaj0u51ivug5NzRxKAIAdBiKpHiHt1BCNcdWoAZ16JaRVURyUub6Ezme90
         HhXexD8ZWaZ33D6p5TXme0308u3+6t4So4n2QoxEnZGi+3C149TRbV7s6MBi7BU5qlaZ
         8Zbg==
X-Gm-Message-State: AOJu0YwfwGlcggoaLDTPd6sM2XCpXOwq3K9SINql0mGQESf2JUDEJ32h
	E9FK7l6S49FgaJX9QpTPMnV1JfV1lUeGFT8klRtSSzce9MfF3f/BwvN2LuPyZ4vRXDVNlX14UVk
	zJbnGIJxRgNmkOx6UvJsDDJIWaKxfi/FV8Q==
X-Received: by 2002:aa7:d70b:0:b0:52a:943:9ab5 with SMTP id t11-20020aa7d70b000000b0052a09439ab5mr13151977edq.31.1696866887055;
        Mon, 09 Oct 2023 08:54:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRjZywirDZ64yAf6mORFe+rGF3Uk+ZjVi9YlmEcdbG6knhzv6qS/whm3MkhFiAAUP4p4ukOg==
X-Received: by 2002:aa7:d70b:0:b0:52a:943:9ab5 with SMTP id t11-20020aa7d70b000000b0052a09439ab5mr13151967edq.31.1696866886657;
        Mon, 09 Oct 2023 08:54:46 -0700 (PDT)
Date: Mon, 9 Oct 2023 11:54:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231009114458-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810C93B29680EB7BBB41BCDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810C93B29680EB7BBB41BCDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Mon, Oct 09, 2023 at 04:15:01AM +0000, Parav Pandit wrote:
> Hi Michael,
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Sunday, October 8, 2023 5:12 PM
> 
> [..]
> > > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline type & Name &
> > > +Description \\ \hline \hline
> > > +0x0 & VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG & Provides common
> > > +configuration space of device for PCI transport \\ \hline
> > > +0x1 & VIRTIO_DEV_CTX_DEV_CFG_LAYOUT & Provides device specific
> > > +configuration layout \\ \hline
> > > +0x2 & VIRTIO_DEV_CTX_DEV_FEATURES & Provides device features \\
> > > +\hline
> > > +0x3 & VIRTIO_DEV_CTX_PCI_VQ_CFG & Provides Virtqueue configuration
> > > +for PCI transport \\ \hline
> > > +0x4 & VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG & Provides Queue run
> > time
> > > +state \\ \hline
> > > +0x5 & VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC & Provides list of
> > > +virtqueue descriptors owned by device  \\ \hline
> > > +0x6 - 0xFFFFFFFF & - & Reserved for future types \\ \hline
> > > +\end{tabularx}
> > 
> > 
> > I don't think this is enough, e.g. virtio net has internal state
> > controlled thought CVQ commands. how do you intend to address/migrate
> > these?
> >
> Post this series, the 32-bit type field will be split into two ranges.
> First range (existing) to cover common content across all device type.
> Second range to contain device specific content, containing non internal fields such as fields setup by the guest directly over CVQ.

How will all this be added though? You probably have a clear picture in
your head but I (and likely other tc members) don't.

> > > +\subsubsection{Device Context Fields}\label{sec:Basic Facilities of a Virtio
> > Device / Device Context / Device Context Fields}
> > > +
> > > +\paragraph{PCI Common Configuration Context}
> > > +\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context
> > Fields/ PCI Common Configuration Context}
> > > +
> > > +For the field VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG, \field{type}
> > is set to 0x0.

Not sure what does RUNTIME do here. 

> > > +The \field{value} is in format of \field{struct virtio_pci_common_cfg}.
> > > +The \field{length} is the length of \field{struct virtio_pci_common_cfg}.
> > > +
> > > +\paragraph{Device Configuration Layout Context}
> > > +\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context
> > Fields/ Device Configuration Layout Context}
> > > +
> > > +For the field VIRTIO_DEV_CTX_DEV_CFG_LAYOUT, \field{type} is set to 0x1.

This name is quite confusing. I see now you just mean this is device
config?

> > > +The \field{value} is in format of device specific configuration layout listed
> > > +in each of the device's device configuration layout section.
> > > +The \field{length} is the length of the device configuration layout data.
> > 
> > Unclear. I am guessing it's doing things like setting up RO
> > fields? This needs to be specified per device really.
> > Also how some fields behave might depend on features.
> In practice fields in this area do not change a lot, but it can for example the link status/speed of net device.
> So it is not RO per say.
> 
> Regarding it be device specific or just a config_length blob, I think config_length blob is just fine for device_context use.
> This is because there isn’t a need for migration driver to parse any of these fields.

Which driver parses what in your current stack is immaterial.  We need
to document all content, just a length is not going to work.

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

