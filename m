Return-Path: <virtio-comment-return-8526-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9157C61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:29:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 44C1B26A36
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:29:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3149C9868A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:29:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 25D94986893; Wed, 22 Nov 2023 04:29:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18187986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 04:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1n5GkEDLPAehedFUzZZ8dA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700627342; x=1701232142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3w41euGlLjrldrOEawF2ar9eW8hSAPAyXHnvvo/EUc=;
        b=RDC7oGXFHT5LVsQAcSkk19fz5ugGn+CRkiwKnyqrqgbYY12udL54WC31/4QESZ4n1u
         npeWu9fl+fy86y9XSK2nQNa1SSbXJVwTwAYNEyzgtAqDwqjzSig0LJiiCLsM3J2EYQ6M
         JSOHxHhZ2Oj6FBp6CU/V8+fgNKwr3NYwUq21/LHRssetX4H3v0/OB2YkPzU9sVz8v/VO
         mv3dqbj53r8p3PAAq05E2r/3o56cg7vFCvyxE3xnb3GtogFGpgrKTNNxpEfcx6FM2kGH
         YoulFP0M/5vhg9H/78Anludy3fDPyRBQYPur13NU094c9wCyiqcIaDrmhRLW1xuYeSWc
         HTRQ==
X-Gm-Message-State: AOJu0YzCQKzXV1FM4gNFmjlVFjNl0xB++jLYA+HsPB6kI03Pmfee7V6R
	igTUFIEBZdEJ5gjQHDTvZ0XbRuQeZqmjhD+mJEta+qMyrgiUTG0XAYA+lhjorkeK4u6LPU3j2HB
	VrVi7RWLGjXQ4kQQRHD7TYo7P+bpY4F0jkM4WpsGkJxNcE+s10g==
X-Received: by 2002:a2e:87d3:0:b0:2c8:790b:cfdb with SMTP id v19-20020a2e87d3000000b002c8790bcfdbmr1669378ljj.16.1700627342021;
        Tue, 21 Nov 2023 20:29:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1aIq0q3TkHw0zpxrap2dvcMElXPEonj+/3HLV0p55InJzbXdwzA7hMvWdB+D4ozSnn03iQm3u+MtYZTV94es=
X-Received: by 2002:a2e:87d3:0:b0:2c8:790b:cfdb with SMTP id
 v19-20020a2e87d3000000b002c8790bcfdbmr1669364ljj.16.1700627341462; Tue, 21
 Nov 2023 20:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20231030131959.1386107-1-parav@nvidia.com> <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-6Q1NQ9x=Mh_ek8ogLeZXiTMRgHwRk1Bt5Y0XWpQrQw@mail.gmail.com> <PH0PR12MB5481A67DD337E7AA76E0D59CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481A67DD337E7AA76E0D59CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Nov 2023 12:28:50 +0800
Message-ID: <CACGkMEsTyYX8mhgrSNP9NCc=FqHh8UN=hs374MV8QLMvZifH9w@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Wed, Nov 22, 2023 at 12:31=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 21, 2023 12:45 PM
> >
> > On Thu, Nov 16, 2023 at 1:30=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Thursday, November 16, 2023 9:54 AM
> > > >
> > > > On Thu, Nov 16, 2023 at 1:39=E2=80=AFAM Parav Pandit <parav@nvidia.=
com>
> > wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, November 13, 2023 9:07 AM
> > > > > >
> > > > > > On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit <parav@nvid=
ia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Tuesday, November 7, 2023 9:34 AM
> > > > > > > >
> > > > > > > > On Mon, Nov 6, 2023 at 2:54=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Monday, November 6, 2023 12:04 PM
> > > > > > > > > >
> > > > > > > > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Sent: Thursday, November 2, 2023 9:54 AM
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav Pandi=
t
> > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > Sent: Wednesday, November 1, 2023 6:00 AM
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav =
Pandit
> > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Par=
av Pandit
> > > > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > During a device migration flow (typically
> > > > > > > > > > > > > > > > > in a precopy phase of the live migration)=
,
> > > > > > > > > > > > > > > > > a device may write to the guest memory.
> > > > > > > > > > > > > > > > > Some iommu/hypervisor may not be able to
> > > > > > > > > > > > > > > > > track these
> > > > > > > > > > > > written pages.
> > > > > > > > > > > > > > > > > These pages to be migrated from source to
> > > > > > > > > > > > > > > > > destination
> > > > > > > > hypervisor.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > A device which writes to these pages,
> > > > > > > > > > > > > > > > > provides the page address record of the t=
o the owner
> > device.
> > > > > > > > > > > > > > > > > The owner device starts write recording
> > > > > > > > > > > > > > > > > for the device and queries all the page
> > > > > > > > > > > > > > > > > addresses written by the
> > > > > > device.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Fixes:
> > > > > > > > > > > > > > > > > https://github.com/oasis-tcs/virtio-spec/=
i
> > > > > > > > > > > > > > > > > ssue
> > > > > > > > > > > > > > > > > s/17
> > > > > > > > > > > > > > > > > 6
> > > > > > > > > > > > > > > > > Signed-off-by: Parav Pandit
> > > > > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > > > > > > > > Signed-off-by: Satananda Burla
> > > > > > > > > > > > > > > > > <sburla@marvell.com>
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > changelog:
> > > > > > > > > > > > > > > > > v1->v2:
> > > > > > > > > > > > > > > > > - addressed comments from Michael
> > > > > > > > > > > > > > > > > - replaced iova with physical address
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > >  admin-cmds-device-migration.tex | 15
> > > > > > > > > > > > > > > > > +++++++++++++++
> > > > > > > > > > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > > > b/admin-cmds-device-migration.tex index
> > > > > > > > > > > > > > > > > ed911e4..2e32f2c
> > > > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > > > --- a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > > > +++ b/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > > > @@ -95,6 +95,21 @@ \subsubsection{Device
> > > > > > > > > > > > > > > > > Migration}\label{sec:Basic Facilities of =
a
> > > > > > > > > > > > > > > > > Virtio Device / The owner driver can
> > > > > > > > > > > > > > > > > discard any partially read or written
> > > > > > > > > > > > > > > > > device context when  any of the device
> > > > > > > > > > > > > > > > > migration flow
> > > > > > > > > > > > > > > > should be aborted.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +During the device migration flow, a
> > > > > > > > > > > > > > > > > +passthrough device may write data to the
> > > > > > > > > > > > > > > > > +guest virtual machine's memory, a source
> > > > > > > > > > > > > > > > > +hypervisor needs to keep track of these
> > > > > > > > > > > > > > > > > +written memory to migrate such memory to
> > > > > > > > > > > > > > > > > +destination
> > > > > > > > > > > > > > > > hypervisor.
> > > > > > > > > > > > > > > > > +Some systems may not be able to keep
> > > > > > > > > > > > > > > > > +track of such memory write addresses at =
hypervisor
> > level.
> > > > > > > > > > > > > > > > > +In such a scenario, a device records and
> > > > > > > > > > > > > > > > > +reports these written memory addresses t=
o
> > > > > > > > > > > > > > > > > +the owner device. The owner driver
> > > > > > > > > > > > > > > > > +enables write recording for one or more
> > > > > > > > > > > > > > > > > +physical address ranges per device durin=
g
> > > > > > > > > > > > > > > > > +device
> > > > > > > > > > > > migration flow.
> > > > > > > > > > > > > > > > > +The owner driver periodically queries
> > > > > > > > > > > > > > > > > +these written physical address
> > > > > > > > > > > > > > records from the device.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I wonder how PA works in this case. Device
> > > > > > > > > > > > > > > > uses untranslated requests so it can only s=
ee IOVA.
> > > > > > > > > > > > > > > > We can't mandate
> > > > > > > > ATS anyhow.
> > > > > > > > > > > > > > > Michael suggested to keep the language unifor=
m
> > > > > > > > > > > > > > > as PA as this is ultimately
> > > > > > > > > > > > > > what the guest driver is supplying during vq
> > > > > > > > > > > > > > creation and in posting buffers as physical add=
ress.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > This seems to need some work. And, can you show
> > > > > > > > > > > > > > me how it can
> > > > > > > > work?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > 1) e.g if GAW is 48 bit, is the hypervisor
> > > > > > > > > > > > > > expected to do a bisection of the whole range?
> > > > > > > > > > > > > > 2) does the device need to reserve sufficient
> > > > > > > > > > > > > > internal resources for logging the dirty page a=
nd why
> > (not)?
> > > > > > > > > > > > > No when dirty page logging starts, only at that
> > > > > > > > > > > > > time, device will reserve
> > > > > > > > > > > > enough resources.
> > > > > > > > > > > >
> > > > > > > > > > > > GAW is 48bit, how large would it have then?
> > > > > > > > > > > Dirty page tracking is not dependent on the size of t=
he GAW.
> > > > > > > > > > > It is function of address ranges for the amount of
> > > > > > > > > > > guest memory regardless of
> > > > > > > > > > GAW.
> > > > > > > > > >
> > > > > > > > > > The problem is, e.g when vIOMMU is enabled, you can't
> > > > > > > > > > know which IOVA is actually used by guests. And even fo=
r
> > > > > > > > > > the case when vIOMMU is not enabled, the guest may have
> > several TBs.
> > > > > > > > > > Is it easy to reserve sufficient resources by the devic=
e itself?
> > > > > > > > > >
> > > > > > > > > When page tracking is enabled per device, it knows about
> > > > > > > > > the range and it can
> > > > > > > > reserve certain resource.
> > > > > > > >
> > > > > > > > I didn't see such an interface in this series. Anything I m=
iss?
> > > > > > > >
> > > > > > > Yes, this patch and the next patch is covering the page
> > > > > > > tracking start,stop and
> > > > > > query commands.
> > > > > > > They are named as write recording commands.
> > > > > >
> > > > > > So I still don't see how the device can reserve sufficient reso=
urces?
> > > > > > Guests may map a very large area of memory to IOMMU (or when
> > > > > > vIOMMU is disabled, GPA is used). It would be several TBs, how
> > > > > > can the device reserve sufficient resources in this case?
> > > > > When the map is established, the ranges are supplied to the devic=
e
> > > > > to know
> > > > how much to reserve.
> > > > > If device does not have enough resource, it fails the command.
> > > > >
> > > > > One can advance it further to provision for the desired range..
> > > >
> > > > Well, I think I've asked whether or not a bisection is needed, and
> > > > you told me not ...
> > > >
> > > > But at least we need to document this in the proposal, no?
> > > >
> > > We should expose a limit of the device in the proposed
> > WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > So that future provisioning framework can use it.
> > >
> > > I will cover this in v5 early next week.
> > >
> > > > > >
> > > > > > >
> > > > > > > > Btw, the IOVA is allocated by the guest actually, how can w=
e
> > > > > > > > know the
> > > > > > range?
> > > > > > > > (or using the host range?)
> > > > > > > >
> > > > > > > Hypervisor would have mapping translation.
> > > > > >
> > > > > > That's really tricky and can only work in some cases:
> > > > > >
> > > > > > 1) It requires the hypervisor to traverse the guest I/O page
> > > > > > tables which could be very large range
> > > > > > 2) It requests the hypervisor to trap the modification of guest
> > > > > > I/O page tables and synchronize with the range changes, which i=
s
> > > > > > inefficient and can only be done when we are doing shadow PTEs.
> > > > > > It won't work when the nesting translation could be offloaded t=
o
> > > > > > the hardware
> > > > > > 3) It is racy with the guest modification of I/O page tables
> > > > > > which is explained in another thread
> > > > > Mapping changes with more hw mmu's is not a frequent event and
> > > > > IOTLB
> > > > flush is done using querying the dirty log for the smaller range.
> > > > >
> > > > > > 4) No aware of new features like PASID which has been explained
> > > > > > in another thread
> > > > > For all the pinned work with non sw based IOMMU, it is typically =
small
> > subset.
> > > > > PASID is guest controlled.
> > > >
> > > > Let's repeat my points:
> > > >
> > > > 1) vq1 use untranslated request with PASID1
> > > > 2) vq2 use untranslated request with PASID2
> > > >
> > > > Shouldn't we log PASID as well?
> > > >
> > > Possibly yes, either to request the tracking per PASID or to log the =
PASID.
> > > When in future PASID based VQ are supported, this part should be
> > extended.
> >
> > Who is going to do the extension? They are orthogonal features for sure=
.
> Whoever extends the VQ for PASID programming.
>
> I plan to have generic command for VQ creation over CVQ

Another unrelated issue.

> for the wider use cases we discussed.

CVQ might want a dedicated PASID.

> It can have PASID parameter in future when one wants to add it.
>
> >
> > >
> > > > And
> > > >
> > > > 1) vq1 is using translated request
> > > > 2) vq2 is using untranslated request
> > > >
> >
> > How about this?
> How did driver program the device for vq1 to translated request and vq2 t=
o not.
> And for which use case?

Again, it is allowed by the PCI spec, no? You've explained yourself
that your design needs to obey PCI spec.

And, if you want to ask. for use case, there are handy:

- ATS
- When IOMMU_PLATFORM is not negotiated
- MSI

Let's make sure the function of your proposal is correct before
talking about any use cases.

>
> >
> > >
> > > > How could we differ?
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > Host should always have more resources than device, in
> > > > > > > > > > that sense there could be several methods that tries to
> > > > > > > > > > utilize host memory instead of the one in the device. I
> > > > > > > > > > think we've discussed this when going through the doc p=
repared
> > by Eugenio.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > What happens if we're trying to migrate more than 1=
 device?
> > > > > > > > > > > >
> > > > > > > > > > > That is perfectly fine.
> > > > > > > > > > > Each device is updating its log of pages it wrote.
> > > > > > > > > > > The hypervisor is collecting their sum.
> > > > > > > > > >
> > > > > > > > > > See above.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > 3) DMA is part of the transport, it's natural t=
o
> > > > > > > > > > > > > > do logging there, why duplicate efforts in the =
virtio layer?
> > > > > > > > > > > > > He he, you have funny comment.
> > > > > > > > > > > > > When an abstract facility is added to virtio you
> > > > > > > > > > > > > say to do in
> > > > > > transport.
> > > > > > > > > > > >
> > > > > > > > > > > > So it's not done in the general facility but tied t=
o the admin
> > part.
> > > > > > > > > > > > And we all know dirty page tracking is a challenge
> > > > > > > > > > > > and Eugenio has a good summary of pros/cons. A
> > > > > > > > > > > > revisit of those docs make me think virtio is not
> > > > > > > > > > > > the good place for doing that for
> > > > > > may reasons:
> > > > > > > > > > > >
> > > > > > > > > > > > 1) as stated, platform will evolve to be able to
> > > > > > > > > > > > tracking dirty pages, actually, it has been
> > > > > > > > > > > > supported by a lot of major IOMMU vendors
> > > > > > > > > > >
> > > > > > > > > > > This is optional facility in virtio.
> > > > > > > > > > > Can you please point to the references? I don=E2=80=
=99t see it
> > > > > > > > > > > in the common Linux
> > > > > > > > > > kernel support for it.
> > > > > > > > > >
> > > > > > > > > > Note that when IOMMUFD is being proposed, dirty page
> > > > > > > > > > tracking is one of the major considerations.
> > > > > > > > > >
> > > > > > > > > > This is one recent proposal:
> > > > > > > > > >
> > > > > > > > > > https://www.spinics.net/lists/kvm/msg330894.html
> > > > > > > > > >
> > > > > > > > > Sure, so if platform supports it. it can be used from the=
 platform.
> > > > > > > > > If it does not, the device supplies it.
> > > > > > > > >
> > > > > > > > > > > Instead Linux kernel choose to extend to the devices.
> > > > > > > > > >
> > > > > > > > > > Well, as I stated, tracking dirty pages is challenging
> > > > > > > > > > if you want to do it on a device, and you can't simply
> > > > > > > > > > invent dirty page tracking for each type of the devices=
.
> > > > > > > > > >
> > > > > > > > > It is not invented.
> > > > > > > > > It is generic framework for all virtio device types as pr=
oposed here.
> > > > > > > > > Keep in mind, that it is optional already in v3 series.
> > > > > > > > >
> > > > > > > > > > > At least not seen to arrive this in any near term in
> > > > > > > > > > > start of
> > > > > > > > > > > 2024 which is
> > > > > > > > > > where users must use this.
> > > > > > > > > > >
> > > > > > > > > > > > 2) you can't assume virtio is the only device that
> > > > > > > > > > > > can be used by the guest, having dirty pages
> > > > > > > > > > > > tracking to be implemented in each type of device i=
s
> > > > > > > > > > > > unrealistic
> > > > > > > > > > > Of course, there is no such assumption made. Where di=
d
> > > > > > > > > > > you see a text that
> > > > > > > > > > made such assumption?
> > > > > > > > > >
> > > > > > > > > > So what happens if you have a guest with virtio and
> > > > > > > > > > other devices
> > > > > > assigned?
> > > > > > > > > >
> > > > > > > > > What happens? Each device type would do its own dirty pag=
e
> > tracking.
> > > > > > > > > And if all devices does not have support, hypervisor know=
s
> > > > > > > > > to fall back to
> > > > > > > > platform iommu or its own.
> > > > > > > > >
> > > > > > > > > > > Each virtio and non virtio devices who wants to repor=
t
> > > > > > > > > > > their dirty page report,
> > > > > > > > > > will do their way.
> > > > > > > > > > >
> > > > > > > > > > > > 3) inventing it in the virtio layer will be
> > > > > > > > > > > > deprecated in the future for sure, as platform will
> > > > > > > > > > > > provide much rich features for logging e.g it can d=
o
> > > > > > > > > > > > it per PASID etc, I don't see any reason virtio nee=
d
> > > > > > > > > > > > to compete with the features that will be provided
> > > > > > > > > > > > by the platform
> > > > > > > > > > > Can you bring the cpu vendors and committement to
> > > > > > > > > > > virtio tc with timelines
> > > > > > > > > > so that virtio TC can omit?
> > > > > > > > > >
> > > > > > > > > > Why do we need to bring CPU vendors in the virtio TC?
> > > > > > > > > > Virtio needs to be built on top of transport or
> > > > > > > > > > platform. There's no need to duplicate
> > > > > > > > their job.
> > > > > > > > > > Especially considering that virtio can't do better than=
 them.
> > > > > > > > > >
> > > > > > > > > I wanted to see a strong commitment for the cpu vendors t=
o
> > > > > > > > > support dirty
> > > > > > > > page tracking.
> > > > > > > >
> > > > > > > > The RFC of IOMMUFD support can go back to early 2022. Intel=
,
> > > > > > > > AMD and ARM are all supporting that now.
> > > > > > > >
> > > > > > > > > And the work seems to have started for some platforms.
> > > > > > > >
> > > > > > > > Let me quote from the above link:
> > > > > > > >
> > > > > > > > """
> > > > > > > > Today, AMD Milan (or more recent) supports it while ARM
> > > > > > > > SMMUv3.2 alongside VT-D rev3.x also do support.
> > > > > > > > """
> > > > > > > >
> > > > > > > > > Without such platform commitment, virtio also skipping it
> > > > > > > > > would not
> > > > work.
> > > > > > > >
> > > > > > > > Is the above sufficient? I'm a little bit more familiar wit=
h
> > > > > > > > vtd, the hw feature has been there for years.
> > > > > > > >
> > > > > > > Vtd has a sticky D bit that requires synchronization with
> > > > > > > IOPTE page caches
> > > > > > when sw wants to clear it.
> > > > > >
> > > > > > This is by design.
> > > > > >
> > > > > > > Do you know if is it reliable when device does multiple
> > > > > > > writes, ie,
> > > > > > >
> > > > > > > a. iommu write D bit
> > > > > > > b. software read it
> > > > > > > c. sw synchronize cache
> > > > > > > d. iommu write D bit on next write by device
> > > > > >
> > > > > > What issue did you see here? But that's not even an excuse, if
> > > > > > there's a bug, let's report it to IOMMU vendors and let them fi=
x it.
> > > > > > The thread I point to you is actually a good space.
> > > > > >
> > > > > So we cannot claim that it is there in the platform.
> > > >
> > > > I'm confused, the thread I point to you did the cache
> > > > synchronization which has been explained in the changelog, so what'=
s the
> > issue?
> > > >
> > > If the ask is for IOMMU chip to fix something, we cannot claim that d=
irty
> > page tracking is available already in platform.
> >
> > Again, can you describe the issue? Why do you think the sticky part is =
an
> > issue? IOTLB needs to be sync with IO page tables, what's wrong with th=
is?
> Nothing wrong with it.
> The text is not affirmative to say it works if the sw clears it.
>
> >
> > >
> > > > >
> > > > > > Again, the point is to let the correct role play.
> > > > > >
> > > > > How many more years should we block the virtio device migration
> > > > > when
> > > > platform do not have it?
> > > >
> > > > At least for VT-D, it has been used for years.
> > > Is this device written pages tracked by KVM for VT-d as dirty page lo=
g,
> > instead through vfio?
> >
> > I don't get this question.
> You said the VT-d has dirty page tracking for years so it must be used by=
 the sw during device migration.

It's the best way if the platform has the support for that.

> And if that is there, how is these dirty pages of iommu are merged with t=
he cpu side?
> Is this done by KVM for passthrough devices for vfio?

I don't see how it is related to the discussion here. IOMMU support is
sufficient as a start. If you requires CPU support, virtio is clearly
the wrong forum.

>
> >
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > ARM SMMU based servers to be present with D bit tracking.
> > > > > > > It is still early to say platform is ready.
> > > > > >
> > > > > > This is not what I read from both the series I posted and the
> > > > > > spec, dirty bit has been supported several years ago at least f=
or vtd.
> > > > > Supported, but spec listed it as sticky bit that may require spec=
ial
> > handling.
> > > >
> > > > Please explain why this is "special handling". IOMMU has several
> > > > different layers of caching, by design, it can't just open a window=
 for D bit.
> > > >
> > > > > May be it is working, but not all cpu platforms have it.
> > > >
> > > > I don't see the point. Migration is not supported for virito as wel=
l.
> > > >
> > > I don=E2=80=99t see a point either to discuss.
> > >
> > > I already acked that platform may have support as well, and not all p=
latform
> > has it.
> > > So the device feeds the data and its platform's choice to enable/disa=
ble.
> >
> > I've pointed out sufficient issues and I don't want to repeat them.
> There does not seem to be any that is critical enough for non viommu case=
.

No, see above.

> Viommu needs to flush the iotlb anyway.

I've explained it in antoher thread.

>
> >
> > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > It is optional so whichever has the support it will be used.
> > > > > >
> > > > > > I can't see the point of this, it is already available. And
> > > > > > migration doesn't exist in virtio spec yet.
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > i.e. in first year of 2024?
> > > > > > > > > >
> > > > > > > > > > Why does it matter in 2024?
> > > > > > > > > Because users needs to use it now.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > If not, we are better off to offer this, and when/if
> > > > > > > > > > > platform support is, sure,
> > > > > > > > > > this feature can be disabled/not used/not enabled.
> > > > > > > > > > >
> > > > > > > > > > > > 4) if the platform support is missing, we can use
> > > > > > > > > > > > software or leverage transport for assistance like
> > > > > > > > > > > > PRI
> > > > > > > > > > > All of these are in theory.
> > > > > > > > > > > Our experiment shows PRI performance is 21x slower
> > > > > > > > > > > than page fault rate
> > > > > > > > > > done by the cpu.
> > > > > > > > > > > It simply does not even pass a simple 10Gbps test.
> > > > > > > > > >
> > > > > > > > > > If you stick to the wire speed during migration, it can=
 converge.
> > > > > > > > > Do you have perf data for this?
> > > > > > > >
> > > > > > > > No, but it's not hard to imagine the worst case. Wrote a
> > > > > > > > small program that dirty every page by a NIC.
> > > > > > > >
> > > > > > > > > In the internal tests we don=E2=80=99t see this happening=
.
> > > > > > > >
> > > > > > > > downtime =3D dirty_rates * PAGE_SIZE / migration_speed
> > > > > > > >
> > > > > > > > So if we get very high dirty rates (e.g by a high speed
> > > > > > > > NIC), we can't satisfy the requirement of the downtime. Or
> > > > > > > > if you see the converge, you might get help from the auto
> > > > > > > > converge support by the hypervisors like KVM where it tries
> > > > > > > > to throttle the VCPU then you can't reach
> > > > > > the wire speed.
> > > > > > > >
> > > > > > > Once PRI is enabled, even without migration, there is basic p=
erf issues.
> > > > > >
> > > > > > The context is not PRI here...
> > > > > >
> > > > > > It's about if you can stick to wire speed during live migration=
.
> > > > > > Based on the analysis so far, you can't achieve wirespeed and
> > > > > > downtime at
> > > > the same time.
> > > > > > That's why the hypervisor needs to throttle VCPU or devices.
> > > > > >
> > > > > So?
> > > > > Device also may throttle itself.
> > > >
> > > > That's perfectly fine. We are on the same page, no? It's wrong to
> > > > judge the dirty page tracking in the context of live migration by
> > > > measuring whether or not the device can work at wire speed.
> > > >
> > > > >
> > > > > > For PRI, it really depends on how you want to use it. E.g if yo=
u
> > > > > > don't want to pin a page, the performance is the price you must=
 pay.
> > > > > PRI without pinning does not make sense for device to make large
> > > > > mapping
> > > > queries.
> > > >
> > > > That's also fine. Hypervisors can choose to enable and use PRI
> > > > depending on the different cases.
> > > >
> > > So PRI is not must for device migration.
> >
> > I never say it's a must.
> >
> > > Device migration must be able to work without PRI enabled, as simple =
as
> > that as first base line.
> >
> > My point is that, you need document
> >
> > 1) why you think dirty page is a must or not
> Explained in the patch already in commit log and in spec theory already.
>
> > 2) why did you choose one of a specific way instead of others
> >
> This is not part of the spec anyway. This is already discussed in mailing=
 list here in community.

It helps the reviewers, it doesn't harm to have a summary in the
changelog. Or people may ask the same questions endlessly.

>
> > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > There is no requirement for mandating PRI either.
> > > > > > > > > > > So it is unusable.
> > > > > > > > > >
> > > > > > > > > > It's not about mandating, it's about doing things in th=
e
> > > > > > > > > > correct layer. If PRI is slow, PCI can evolve for sure.
> > > > > > > > > You should try.
> > > > > > > >
> > > > > > > > Not my duty, I just want to make sure things are done in th=
e
> > > > > > > > correct layer, and once it needs to be done in the virtio,
> > > > > > > > there's nothing obviously
> > > > > > wrong.
> > > > > > > >
> > > > > > > At present, it looks all platforms are not equally ready for =
page
> > tracking.
> > > > > >
> > > > > > That's not an excuse to let virtio support that.
> > > > > It is wrong attribution as excuse.
> > > > >
> > > > > > And we need also to figure out if virtio can do that easily.
> > > > > > I've pointed out sufficient issues, I'm pretty sure there would
> > > > > > be more as the platform evolves.
> > > > > >
> > > > > I am not sure if virtio feeds the log into the platform.
> > > >
> > > > I don't understand the meaning here.
> > > >
> > > I mistakenly merged two sentences.
> > >
> > > Virtio feeds the dirty page details to the hypervisor platform which =
collects
> > and merges the page record.
> > > So it is platform choice to use iommu based tracking or device based.
> > >
> > > > >
> > > > > > >
> > > > > > > > > In the current state, it is mandating.
> > > > > > > > > And if you think PRI is the only way,
> > > > > > > >
> > > > > > > > I don't, it's just an example where virtio can leverage fro=
m
> > > > > > > > either transport or platform. Or if it's the fault in virti=
o
> > > > > > > > that slows down the PRI, then it is something we can do.
> > > > > > > >
> > > > > > > Yea, it does not seem to be ready yet.
> > > > > > >
> > > > > > > > >  than you should propose that in the dirty page tracking
> > > > > > > > > series that you listed
> > > > > > > > above to not do dirty page tracking. Rather depend on PRI, =
right?
> > > > > > > >
> > > > > > > > No, the point is to not duplicate works especially
> > > > > > > > considering virtio can't do better than platform or transpo=
rt.
> > > > > > > >
> > > > > > > Both the platform and virtio work is ongoing.
> > > > > >
> > > > > > Why duplicate the work then?
> > > > > >
> > > > > Not all cpu platforms support as far as I know.
> > > >
> > > > Yes, but we all know the platform is working to support this.
> > > >
> > > > Supporting this on the device is hard.
> > > >
> > > This is optional, whichever device would like to implement it, will s=
upport it.
> > >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > When one does something in transport, you say,
> > > > > > > > > > > > > this is transport specific, do
> > > > > > > > > > > > some generic.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Here the device is being tracked is virtio device=
.
> > > > > > > > > > > > > PCI-SIG has told already that PCIM interface is
> > > > > > > > > > > > > outside the scope of
> > > > > > it.
> > > > > > > > > > > > > Hence, this is done in virtio layer here in abstr=
act way.
> > > > > > > > > > > >
> > > > > > > > > > > > You will end up with a competition with the
> > > > > > > > > > > > platform/transport one that will fail.
> > > > > > > > > > > >
> > > > > > > > > > > I don=E2=80=99t see a reason. There is no competition=
.
> > > > > > > > > > > Platform always have a choice to not use device side
> > > > > > > > > > > page tracking when it is
> > > > > > > > > > supported.
> > > > > > > > > >
> > > > > > > > > > Platform provides a lot of other functionalities for di=
rty logging:
> > > > > > > > > > e.g per PASID, granular, etc. So you want to duplicate
> > > > > > > > > > them again in the virtio? If not, why choose this way?
> > > > > > > > > >
> > > > > > > > > It is optional for the platforms where platform do not ha=
ve it.
> > > > > > > >
> > > > > > > > We are developing new virtio functionalities that are
> > > > > > > > targeted for future platforms. Otherwise we would end up
> > > > > > > > with a feature with a very narrow use case.
> > > > > > > In general I agree that platform is an option too.
> > > > > > > Hypervisor will be able to make the decision to use platform
> > > > > > > when available
> > > > > > and fallback to device method when platform does not have it.
> > > > > > >
> > > > > > > Future and to be equally usable in near term :)
> > > > > >
> > > > > > Please don't double standard again:
> > > > > >
> > > > > > When you are talking about TDISP, you want virtio to be designe=
d
> > > > > > to fit for the future where the platform is ready in the future
> > > > > > When you are talking about dirty tracking, you want it to work
> > > > > > now even if
> > > > > >
> > > > > The proposal of transport VQ is anti-TDISP.
> > > >
> > > > It's nothing about transport VQ, it's about you're saying the admin=
q
> > > > based device context. There's a comment to point out that the
> > > > current TDISP spec forbids modifying device state when TVM is
> > > > attached. Then you told us the TDISP may evolve for that.
> > > So? That is not double standard.
> > > The proposal is based on main principle that it is not depending on
> > > hypervisor traping + emulating which is the baseline of TDISP
> > >
> > > >
> > > > > The proposal of dirty tracking is not anti-platform. It is
> > > > > optional like rest of the
> > > > platform.
> > > > >
> > > > > > 1) most of the platform is ready now
> > > > > Can you list a ARM server CPU in production that has it? (not in
> > > > > some pdf
> > > > spec).
> > > >
> > > > Then in the context of a dirty page, I've proved you dirty page
> > > > tracking has been supported by all major vendors.
> > > Major IP vendor !=3D major cpu chip vendor.
> > > I don=E2=80=99t agree with the proof.
> >
> > So this will be an endless debate. Did I ever ask you about ETA or any =
product
> > for TDISP?
> >
> ETA for TDISP is not relevant.
> You claimed for _major_ vendor support based on nonphysical cpu, hence th=
e disagreement.

How did you define "support"?

Dirty tracking has been wroted into the IOMMU manual for Intel, AMD
and ARM for years. So you think it's not supported now? I've told you
it has been shipped by Intel at least then you ask me which ARM vendor
ships those vIOMMU.

For TDISP live migration, PCI doesn't even have a draft, no? I never
ask which chip vendor ships the platform.

You want to support dirty page tracking in virtio and keep asking when
it is supported by all platform vendors.

You want to prove your proposal can work for TDISP and TDISP migration
but never explain when it would be supported by at least one vendor.

Let's have a unified standard please.

> And that is not the reality.
>
> > >
> > > I already acknowledged that I have seen internal test report for dirt=
y tracking
> > with one cpu and nic.
> > >
> > > I just don=E2=80=99t see all cpus have support for it.
> > > Hence, this optional feature.
> >
> > Repeat myself again.
> >
> > If it can be done easily and efficiently in virtio, I agree. But I've p=
ointed out
> > several issues where it is not answered.
>
> I have answered most of your questions.
>
> The definition of 'easy' is very subjective.

The reason why I don't think it is easy is because I can easily see
several issues that can't be solved easily.

> At one point RSS was also not easy in some devices and IOMMU dirty page t=
racking was also not easy.

Yes, but we can offload the IOMMU part to the vendor. Virtio can't do
anything especially the part that duplicates with the function
provided by the transport or platform.

>
> >
> > >
> > > > Where you refuse to use the standard you used in explaining adminq
> > > > for device context in TDISP.
> > > >
> > > > So I didn't ask you the ETA of the TDISP support for migration or
> > > > adminq, but you want me to give you the production information whic=
h is
> > pointless.
> > > Because you keep claiming that _all_ cpus in the world has support fo=
r
> > efficient dirty page tracking.
> > >
> > > > You
> > > > might need to ask ARM to get an answer, but a simple google told me
> > > > the effort to support dirty page tracking in SMMUv3 could go back t=
o early
> > 2021.
> > > >
> > > To my knowledge ARM do not produce physical chips.
> > > Your proposal is to keep those ARM server vendors to not use virtio d=
evices.
> >
> > This arbitrary conclusion makes no sense.
> >
> Your conclusion about "all" and "major" physical cpu vendor supporting di=
rty page tracking is equally arbitrary.
> So better to not argue on this.

See above.

Thanks


>
> > I know at least one cloud vendor has used a virtio based device for yea=
rs on
> > ARM. And that vendor has posted patches to support dirty page tracking =
since
> > 2020.
> >
> > Thanks
> >
> > > Does not make sense to me.
> > >
> > > > https://lore.kernel.org/linux-iommu/56b001fa-b4fe-c595-dc5e-
> > > > f362d2f07a19@linux.intel.com/t/
> > > >
> > > > Why is it not merged? It's simply because we agree to do it in the
> > > > layer of IOMMUFD so it needs to wait.
> > > >
> > > > Thanks
> > > >
> > > >
> > > > >
> > > > > > 2) whether or not virtio can log dirty page correctly is still
> > > > > > suspicious
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > There is no double standard. The feature is optional which
> > > > > co-exists as
> > > > explained above.
> > >
>



This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

