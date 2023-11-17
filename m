Return-Path: <virtio-comment-return-8440-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2990DC197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:41:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 732DB7410D
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:41:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4EA82986E27
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:41:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3BC9E986E1C; Fri, 17 Nov 2023 10:41:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C2F1986E1D
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _SmrKdxBOUOsAvsArnhOUQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217659; x=1700822459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pym5g1SImMLZd474QaZ1zZpE7FpwzkNrSCe9WLRYsA=;
        b=ALZtFoAtmeh2RAzezDSptTE3FIfcmtVIktZSMM54rzX98uKu69IbxfPmZ+gS7WBV27
         Pl8Ve4kA5PA5OIhaEFdhvklxhgaqizc3grTZEpFKwI/ZcO/3OXxIG+Fp+0C2yuRuCbDA
         G2muCrTKXUcuDxruN72RiyuuWk9jFlBM2y7SU0ajASl2wYimmX3e2+o58NPQrVBPMIK8
         5Ajj70dB7qXEX7jopBi2QRQKZV3n8/R54OIeQGfiMEAHCt9Y6NIdHP/SY16vHMdDwlt7
         bl0qSnwh30XkyglzLRrZUrZGQ5LxBuFnuggyx2NQH/n6iauLMzY//+HkHCrkGzhN7by9
         WyiA==
X-Gm-Message-State: AOJu0YwL6WIYc4WO2IS7SolqmS2O9LJDBEh2m1Jk3lr6wNfZuNVK/KhX
	K6DWmgjy3cs4/gtlPxOlDdmlc5Q+le0Qx9A35IjbU/alEWZA0gWoMNL5dgxZc7foyHDsxhJcL+/
	mvzmuHRRxalPX6OWVG2O8e+LFy3pGYu4nTw==
X-Received: by 2002:a2e:a593:0:b0:2bc:d8cb:59fe with SMTP id m19-20020a2ea593000000b002bcd8cb59femr9457501ljp.8.1700217659497;
        Fri, 17 Nov 2023 02:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd8+1M0JXlmiHFUH2EE566+AVqADswOqD7bATPm3i275u5E77eGaIKG+8QixdThpx2LIhTHA==
X-Received: by 2002:a2e:a593:0:b0:2bc:d8cb:59fe with SMTP id m19-20020a2ea593000000b002bcd8cb59femr9457484ljp.8.1700217659154;
        Fri, 17 Nov 2023 02:40:59 -0800 (PST)
Date: Fri, 17 Nov 2023 05:40:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117053844-mutt-send-email-mst@kernel.org>
References: <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
 <20231116065416-mutt-send-email-mst@kernel.org>
 <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
MIME-Version: 1.0
In-Reply-To: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 05:59:35PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> > On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > > We should expose a limit of the device in the proposed WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > > > So that future provisioning framework can use it.
> > > > > 
> > > > > I will cover this in v5 early next week.
> > > > I do worry about how this can even work though. If you want a generic
> > > > device you do not get to dictate how much memory VM has.
> > > > 
> > > > Aren't we talking bit per page? With 1TByte of memory to track ->
> > > > 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > 
> > > > And you happily say "we'll address this in the future" while at the same
> > > > time fighting tooth and nail against adding single bit status registers
> > > > because scalability?
> > > > 
> > > > 
> > > > I have a feeling doing this completely theoretical like this is problematic.
> > > > Maybe you have it all laid out neatly in your head but I suspect
> > > > not all of TC can picture it clearly enough based just on spec text.
> > > > 
> > > > We do sometimes ask for POC implementation in linux / qemu to
> > > > demonstrate how things work before merging code. We skipped this
> > > > for admin things so far but I think it's a good idea to start doing
> > > > it here.
> > > > 
> > > > What makes me pause a bit before saying please do a PoC is
> > > > all the opposition that seems to exist to even using admin
> > > > commands in the 1st place. I think once we finally stop
> > > > arguing about whether to use admin commands at all then
> > > > a PoC will be needed before merging.
> > > We have POR productions that implemented the approach in my series. They are
> > > multiple generations
> > > of productions in market and running in customers data centers for years.
> > > 
> > > Back to 2019 when we start working on vDPA, we have sent some samples of
> > > production(e.g., Cascade Glacier)
> > > and the datasheet, you can find live migration facilities there, includes
> > > suspend, vq state and other
> > > features.
> > > 
> > > And there is an reference in DPDK live migration, I have provided this page
> > > before:
> > > https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html, it has been working for
> > > long long time.
> > > 
> > > So if we let the facts speak, if we want to see if the proposal is proven to
> > > work, I would
> > > say: They are POR for years, customers already deployed them for years.
> > And I guess what you are trying to say is that this patchset
> > we are reviewing here should be help to the same standard and
> > there should be a PoC? Sounds reasonable.
> Yes and the in-marketing productions are POR, the series just improves the
> design,
> for example, our series also use registers to track vq state, but
> improvements
> than CG or BSC. So I think they are proven to work.

Well yes and no. It works for vdpa because it's a very specific device
with very specific behaviour. If it needs to work for virtio generally,
then 16 bits of state won't be enough so registers won't work.


> > 
> > > For dirty page tracking, I see you want both platform IOMMU tracking and
> > > shadow vqs, I am
> > > totally fine with this idea. And I think maybe we should merge the basic
> > > features first, and
> > > dirty page tracking should be the second step.
> > > 
> > > Thanks
> > Parav wants to add an option of on-device tracking. Which also seems
> > fine. I think it should be optional though because shadow and IOMMU
> > options exist.
> I agree, the vendor can choose to implement their own facility as a backup.
> > 

No that is a bad idea if vendor is doing full virtio, things need to be in spec.

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

