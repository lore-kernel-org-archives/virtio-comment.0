Return-Path: <virtio-comment-return-4760-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA3EC6FA99
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 00:35:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A38831318C4
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 00:35:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8FC659866EE
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 00:35:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 86C349866E5; Wed,  8 Mar 2023 00:35:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE4E19866E4
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 00:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yVjL8_K4NpqA1VahKspg3g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678235660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcL9MWR+ee4NuT46Y5FipXNQ3kQWLSNpTM+DtBN2ghU=;
        b=HFXK8sSWwLP5d9D/DqoE4wsvf/+yyb/UIR0IVkaPiOs/XKeBlXS18WFHi+3ttp2WvM
         nc8hkvNanHWtdiE9zP9rfzYYFgXdeCHHHv6XGyo/pnJJmfB8jcy4FkRgG6a/c7VDa5+5
         wUkNcHv3b8RvE1tLRzqt5iWXn2c7m+LYMna9xIshl2rA+dhULCgfPftGHYr1GBXpU5AZ
         jGvFWRkOmpBNoPpEIWyBytkhn9kNJphJp2bwG1XNNoea7P7ueCfA1Vii/SbWWiSBWUme
         pnkWnuag5Hk97/mYlauWAVEaqyHGWHeksbsmHoJFrYWpSy79RuMKBD5MAgMpuav9dFM3
         p/hg==
X-Gm-Message-State: AO0yUKXnSoztZCjBpf5vyaTanPvjPX4azmRc56PLu8Ezlww6RCrPD0Lf
	cF8aMr1X2vNWuCuDcoL7o5mXcQBZ2JYLJw0CUtKq4VCXJb1ju/ejVKiIKFQMHuAgRBqhEvSEteK
	XRqkXKKLRy1Upy9G/TKoGqiTTCf6NaKKX1g==
X-Received: by 2002:a05:6402:1a4d:b0:4a2:223d:4514 with SMTP id bf13-20020a0564021a4d00b004a2223d4514mr15884758edb.8.1678235660201;
        Tue, 07 Mar 2023 16:34:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9DsQF4cP3KTiG/CK6TeKBSL0M63LPOewwsSndMNrT/in/MFgrWRvmb6/v4yTq/7rqEGqrazw==
X-Received: by 2002:a05:6402:1a4d:b0:4a2:223d:4514 with SMTP id bf13-20020a0564021a4d00b004a2223d4514mr15884740edb.8.1678235659905;
        Tue, 07 Mar 2023 16:34:19 -0800 (PST)
Date: Tue, 7 Mar 2023 19:34:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230307192752-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <910b3607a5f255134d30b3e1233e564f564eafb8.1677761896.git.mst@redhat.com>
 <PH0PR12MB548116853CAC23DF9CA7345EDCB29@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230302201912.GC2554028@fedora>
 <20230302185803-mutt-send-email-mst@kernel.org>
 <20230303131703.GB2866370@fedora>
 <20230303081900-mutt-send-email-mst@kernel.org>
 <4f869944-4ccd-c51e-0f30-dc3ba15ffd52@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <4f869944-4ccd-c51e-0f30-dc3ba15ffd52@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 03/10] admin: introduce group administration commands

On Mon, Mar 06, 2023 at 01:04:42PM +0200, Max Gurtovoy wrote:
> 
> 
> On 03/03/2023 15:19, Michael S. Tsirkin wrote:
> > On Fri, Mar 03, 2023 at 08:17:03AM -0500, Stefan Hajnoczi wrote:
> > > On Thu, Mar 02, 2023 at 07:01:56PM -0500, Michael S. Tsirkin wrote:
> > > > On Thu, Mar 02, 2023 at 03:19:12PM -0500, Stefan Hajnoczi wrote:
> > > > > On Thu, Mar 02, 2023 at 06:40:29PM +0000, Parav Pandit wrote:
> > > > > > 
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Thursday, March 2, 2023 8:05 AM
> > > > > > 
> > > > > > > +When \field{status} is VIRTIO_ADMIN_STATUS_OK, \field{status_qialifier}
> > > > > > > +is reserved and set to zero by the device.
> > > > > > > +
> > > > > > s/status_qialifier/status_qualifier
> > > > > > Missed from v10 of Feb.
> > > > > > 
> > > > > > > +When \field{status} is VIRTIO_ADMIN_STATUS_EINVAL, the following table
> > > > > > > +describes possible \field{status_qialifier} values:
> > > > > > s/status_qialifier/status_qualifier
> > > > > > 
> > > > > > Can you please add other useful error codes in addition to the EINVAL?
> > > > > > Few that we are needed EAGAIN, ENOMEM, EBUSY, ENODEV.
> > > > > 
> > > > > Please define a unique constant for each error condition that can occur
> > > > > instead of sharing catch-all errno constants between multiple error
> > > > > conditions. If a driver wants to squash them together into an errno,
> > > > > that's fine, but I think doing this at the hardware interface level is
> > > > > just propagating the mistakes of errnos.
> > > > > 
> > > > > Only status_qualifier is needed and the vague status field can be
> > > > > dropped. It's not clear to me why adding EAGAIN, ENOMEM, EBUSY, and
> > > > > ENODEV is useful. They have no meaning to the driver, only the
> > > > > status_qualifier really indicates what is going on.
> > > > 
> > > > At a high level at the moment we have only two cases:
> > > > - ok
> > > > - invalid input supplied by driver
> > > > 
> > > > maybe we will have more reasons for a failure - remains to
> > > > be seen.
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > > 
> > > > > I'm sure you guys have discussed this previously, but please provide
> > > > > rationale in the spec because it looks weird to someone with fresh eyes.
> > > > > 
> > > > > Stefan
> > > > 
> > > > Really most drivers just want to propagate errno to userspace.
> > > > All the detailed reporting is for sure well intentional but
> > > > in the end it is at best printed into log - end to end
> > > > people just end up with a switch statement
> > > > converting these to errno codes.
> > > > So we are passing them from device and this way there will be
> > > > some uniformity.
> > > 
> > > Please clarify the rationale in the spec. I don't agree with it, as
> > > explained in my earlier email, but as long as its documented, people can
> > > try to follow it.
> > > 
> > > Stefan
> > 
> > It's 2:2 for now, you are with Parav, me and Cornelia like it :)
> > Or I will try to document it better.
> I don't understand this status_qualifier as well and it wasn't included in
> my original patch set.

Sounds like you feel I should drop your S.O.B - is this the complaint?
I wanted to give attribution since I started with that but sure, no
problem.

> I vote for "status" that describe generic status codes and
> "command_specific_error" that should be inspected by the driver only if
> "status" is set to "VIRTIO_ADMIN_STATUS_COMMAND_SPECIFIC_ERR".
> We discussed this so many times before (and already agreed IIRC) and adding
> this new qualifiers mechanism sounds not right to me and not intuitive for
> device and driver developers.
> 
> I suggest:
> 
> 1. VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE
> 2. VIRTIO_ADMIN_STATUS_Q_INVALID_FIELD
> 3. VIRTIO_ADMIN_STATUS_Q_INVALID_GROUP
> 4. VIRTIO_ADMIN_STATUS_Q_INVALID_MEMBER
> 5. VIRTIO_ADMIN_STATUS_COMMAND_SPECIFIC_ERR (for more info read the
> command_specific_error field).

I don't think it's a good idea, we'll have to agree to disagree.


The point is simple. We can have a detailed virtio specific error.
Nice for debugging most drivers won't know what to do with it.
This is the status_qualifier.
Very detailed but
generally drivers will just have a giant switch statement translating
it to a simple error code for userspace.
So to save everyone work, we also added "status"
a generic kind of error class that is easy to pass to userspace
with a small switch statement.

COMMAND_SPECIFIC_ERR is just way too much detail - commands generally
just should not fail it's a quality of implementation issue.



> 
> 
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

