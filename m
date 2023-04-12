Return-Path: <virtio-comment-return-5428-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A636C77B6E
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:03:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 844B03E309
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:02:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E509986520
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:02:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 748F59841AB; Wed, 12 Apr 2023 05:02:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62F1098650E
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 05:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AOaeHOatPBy9VmXjlL0L6A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681275776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RgyQScNj5DeCERmyiYZY8GJSw8uO6dFFaeCeu+QIGw=;
        b=I6i91uQZgkCnDsne3GbkJGMIBgbU+ZRwNeRA3H6A29kEYyjJOzDgzlJ61yCK/G/GTf
         uDlcEdt4hh+siQLdCGX85MlNMnmCJzcDkMuaTrGgBZF9IZpHeF/rS5muzE/SjAUgu7Bx
         54A+8+/j9vbqCZnnJFy2I2j3GeOvel+U5i/W9EIcZMVzPh1v9/+0FlM3xG7s4NRPM9gH
         TtZ43IzxT7Sc5QeAc7zAGVrkbqGOhMLPhV7q+d3cL9Cs9G+Rma8XyM71HNhnwb1Ap/9Y
         wR2/O1nl9vCYC7cr7svZX16kOkg4binPeKAZze7Fr5KQWOo4+xxCwnCOubB3RvgaO8XT
         CMLg==
X-Gm-Message-State: AAQBX9eUqhpmPhN3ZrbZb4E1bNWbSjOCb0vdo0eaTT0XC5BMQxFDoyeL
	Gx2so2728wuRFeq1kewCvvgnkKM4txj9nMsUdWszzFP4K8iAjLbZevVBcFEWl3bqOxsmyYpA3eR
	vTQiuphOFEI4jsgLRzY5inloFYatJCjhzsA==
X-Received: by 2002:a7b:c406:0:b0:3ed:ca62:418e with SMTP id k6-20020a7bc406000000b003edca62418emr11571202wmi.9.1681275775894;
        Tue, 11 Apr 2023 22:02:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvNygYf/Otg1bFsEEuG5GbzcIhIS+C/XZsT/ZMv5X0NALsP3cvuyl9zMJSKI1l91KCOF/BZg==
X-Received: by 2002:a7b:c406:0:b0:3ed:ca62:418e with SMTP id k6-20020a7bc406000000b003edca62418emr11571192wmi.9.1681275775607;
        Tue, 11 Apr 2023 22:02:55 -0700 (PDT)
Date: Wed, 12 Apr 2023 01:02:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230412010224-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-11-parav@nvidia.com>
 <20230412003006-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481394D07C5CFBB2347B5F0DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230412004152-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548170E8002F19709C6D55ADDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548170E8002F19709C6D55ADDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 10/11] transport-pci: Use driver notification PCI
 capability

On Wed, Apr 12, 2023 at 04:48:41AM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, April 12, 2023 12:43 AM
> > To: Parav Pandit <parav@nvidia.com>
> > Cc: virtio-dev@lists.oasis-open.org; cohuck@redhat.com; virtio-
> > comment@lists.oasis-open.org; Shahaf Shuler <shahafs@nvidia.com>;
> > Satananda Burla <sburla@marvell.com>
> > Subject: Re: [PATCH 10/11] transport-pci: Use driver notification PCI capability
> > 
> > On Wed, Apr 12, 2023 at 04:37:05AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, April 12, 2023 12:31 AM
> > > >
> > > > On Fri, Mar 31, 2023 at 01:58:33AM +0300, Parav Pandit wrote:
> > > > > PCI devices support memory BAR regions for performant driver
> > > > > notifications using the notification capability.
> > > > > Enable transitional MMR devices to use it in simpler manner.
> > > > >
> > > > > Co-developed-by: Satananda Burla <sburla@marvell.com>
> > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > ---
> > > > >  transport-pci.tex | 28 ++++++++++++++++++++++++++++
> > > > >  1 file changed, 28 insertions(+)
> > > > >
> > > > > diff --git a/transport-pci.tex b/transport-pci.tex index
> > > > > 55a6aa0..4fd9898 100644
> > > > > --- a/transport-pci.tex
> > > > > +++ b/transport-pci.tex
> > > > > @@ -763,6 +763,34 @@ \subsubsection{Notification structure
> > > > > layout}\label{sec:Virtio Transport Options  cap.length >=
> > > > > queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
> > > > >
> > > > > +\paragraph{Transitional MMR Interface: A note on Notification
> > > > > +Capability} \label{sec:Virtio Transport Options / Virtio Over PCI
> > > > > +Bus / Virtio Structure PCI Capabilities / Notification capability
> > > > > +/ Transitional MMR Interface}
> > > > > +
> > > > > +The transitional MMR device benefits from receiving driver
> > > > > +notifications at the Queue Notification address offered using the
> > > > > +notification capability, rather than via the memory mapped legacy
> > > > > +QueueNotify configuration register.
> > > > > +
> > > > > +Transitional MMR device uses same Queue Notification address
> > > > > +within a BAR for all virtqueues:
> > > > > +\begin{lstlisting}
> > > > > +cap.offset
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The transitional MMR device MUST support Queue Notification
> > > > > +address within a BAR for all virtqueues at:
> > > > > +\begin{lstlisting}
> > > > > +cap.offset
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The transitional MMR driver that wants to use driver
> > > > > +notifications offered using notification capability MUST use same
> > > > > +Queue Notification address within a BAR for all virtqueues at:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +cap.offset
> > > > > +\end{lstlisting}
> > > > > +
> > > > Why? What exactly is going on here? legacy drivers will not do this.
> > >
> > > Legacy driver does in the q notify register that was sandwitched in between
> > of slow configuration registers.
> > > This is the notification offset for the hypervisor driver to perform the
> > notification on behalf of the guest driver so that the acceleration available for
> > the non-transitional device can be utilized here as well.
> > 
> > I don't get it. What acceleration? for guests you need a separate page so card
> > can be mapped directly while config causes an exit. But hypervisor can access
> > any register without vmexits.
> 
> Typically when guest VM writes to IOBAR q notification register, a vmexit occurs.
> On that occurrence, hypervisor driver forwards the q notification using the q notification region which is defined by struct virtio_pci_notify_cap.

What is wrong with forwarding it on the legacy window?

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

