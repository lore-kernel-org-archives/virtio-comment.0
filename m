Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD703A8C0
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721038122; cv=none; b=aO8cZVZScW6odBPAbGmAnjubPmMcRRGSSCpnOrrrkHE/oA8caol+KpB5f4UyjaNoLnwkNLBtraffAvnwKcLC5cLkk5aWFt38gOXmn4t6Hx6Krg8M/GLzw9FkbNDePqXSw7aDSFBBkhSNJHpSPoGoqKTXdd+9uJBIIocyaxCa4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721038122; c=relaxed/simple;
	bh=EPZxMHXlIHmNZbzNqZ/hfKP1KEMEZxwn8Kzb6WBuL64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UhHQnBcvjIYxSCKsY4QIjrF7L0ZwST2lUooY7ZsloxVgoYTnDolM8Q8DmdGpl1xLBdzlKYtS6M9AEW51zL1SiG2AaMqDVuji28BHmIttciXNbLrkTb8CsBOLWGOG34+2MV0Wsb7cil9wyAug/P4Ez7fQv6aVmP8jgG0p4wSuv/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVL7NtYR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVL7NtYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721038119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E95iN6cyDmhiMDVCCME/oZhV3XyrEFlTuCdm9IGNZQI=;
	b=TVL7NtYRFniyegenfEjAqfxZS9f/FS4yOx44yC1LB8dvgvXtfH/OxxkEakz2zSqwI2vK7M
	gMZYS0ABjVc8e5DDC6GV9T2SV9/a8FW4EHe1vfCGRlIbGO9c3OgMoyammt/2BmULciENDE
	bKfAyPNMrq0lBxgEltkRTSRM84suOx4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-JBAw8OlIO4C2_LYbvEFP5w-1; Mon, 15 Jul 2024 06:08:38 -0400
X-MC-Unique: JBAw8OlIO4C2_LYbvEFP5w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3678f403afaso2530883f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 03:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721038116; x=1721642916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E95iN6cyDmhiMDVCCME/oZhV3XyrEFlTuCdm9IGNZQI=;
        b=tx76Y334+vRc+QtHq9b4odL+uSWYOY15tHdz2bOUFXeBcS7X5le70Wo4dGRu9C/a7O
         3np5YG0AqdrRc1q0AH0rlWq2raJYr9Tc0vPlCTy5zvVxCoPqSEaVhWBs3iucZj46Zy31
         dIlOjqx0VsnR60BOD62qENij5/1SQXY/5GObfo059DW0wtcoodvJBi4apHyZh1DT5GJN
         bxEitDQw7A3rCkCV7j66fME2qP+hoEzjYkADMzbua32sNP8NdjFO2ElhSRJDIQZxFZV+
         IjqSn19xolPCvasHM9ZF5E/2YyCv2BT0O89nbZ2z2FKVZsEsKnyvsC1K0f3ccGfiSUHU
         lkiw==
X-Gm-Message-State: AOJu0YxIqcKBidsA4EisLar+Gqk70LkMsQbxRfW00m+syTSRZarNPWH1
	zW3rLHsNGnKY+XNS4vtaPvpwrykW7EqKCPojQN4t3iTVt1pR9HdoGxjabquxMwazgCytp2gwIlt
	075VkNyBUGl9XpsKGmmIzoiFjgYrpFaek4MZUXAqcMKFrl3Ywsfql2CHpsETJpyBd/RgkzGDU
X-Received: by 2002:adf:f648:0:b0:367:918e:a106 with SMTP id ffacd0b85a97d-367cead9226mr11977558f8f.59.1721038116475;
        Mon, 15 Jul 2024 03:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB//IlF+4SycFeMyV18mKnOHx68FyyHWfcnQx/+phb16mWnTxO7eGZJytqCbWBACRkBZV51A==
X-Received: by 2002:adf:f648:0:b0:367:918e:a106 with SMTP id ffacd0b85a97d-367cead9226mr11977539f8f.59.1721038115857;
        Mon, 15 Jul 2024 03:08:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5146:27c:20a3:47d4:904])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbd2sm5877388f8f.49.2024.07.15.03.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:08:35 -0700 (PDT)
Date: Mon, 15 Jul 2024 06:08:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: Re: [PULL v4 ] administration commands for device parts
Message-ID: <20240715060431-mutt-send-email-mst@kernel.org>
References: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
 <20240714115023-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DCC7A15A54F6595AF7F0DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481DCC7A15A54F6595AF7F0DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 14, 2024 at 10:20:33PM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, July 14, 2024 9:21 PM
> > 
> > On Sun, Jul 14, 2024 at 03:01:07PM +0000, Parav Pandit wrote:
> > > From: Parav Pandit <parav@nvidia.com>
> > >
> > > Hi Michael, Cornelia,
> > >
> > > The following changes since commit
> > 9b3129fe72360a78e76b6dd890d3abc5a45fa915:
> > >
> > >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > > (2024-07-12 06:43:53 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v4
> > >
> > > for you to fetch changes up to
> > f89c2818bba1bd0d80bb12372973deb6908931f2:
> > >
> > >   editorial: replace hyperref with ref (2024-07-14 17:44:14 +0300)
> > >
> > > If the change f89c2818bba1bd0d80bb12372973deb6908931f2 still not
> > > reaches to your expected quality level, can you please pull upto
> > 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2?
> > > I will supply the requested improvements on top of virtio-1.4 branch
> > > on top of
> > > 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2 once merged.
> > >
> > > ----------------------------------------------------------------
> > > This tag contains administration commands for device parts
> > >
> > > changelog:
> > > v3->v4:
> > > - addressed Michael's comment to add fixes tag to the patches
> > >   in editorial patch
> > > v2->v3:
> > > - added message-id to the last patch
> > > - fixed reference to named reference in the last patch
> > > v1->v2:
> > > - fixed hyper reference to name reference
> > > - fixed typo in commit log
> > > - reduced the patches of pull request due to rebase of virtio-1.4
> > > branch
> > > v0->v1:
> > > - resolved merge conflict for an empty line in newdevice.tex
> > >
> > >
> > > ----------------------------------------------------------------
> > > Parav Pandit (6):
> > >       admin: Add theory of operation for device parts
> > >       admin: Extend resource objects for sr-iov group type
> > >       admin: Add admin commands for device parts
> > >       admin: Define common device parts
> > >       admin: Add requirements of device parts commands
> > >       editorial: replace hyperref with ref
> > >
> > >  admin-cmds-capabilities.tex     |  16 ++
> > >  admin-cmds-device-parts.tex     | 469
> > ++++++++++++++++++++++++++++++++++++++++
> > >  admin-cmds-resource-objects.tex |  29 ++-
> > >  admin.tex                       |  12 +-
> > >  conformance.tex                 |   2 +
> > >  content.tex                     |   1 +
> > >  device-parts.tex                | 232 ++++++++++++++++++++
> > >  newdevice.tex                   |  24 +-
> > >  8 files changed, 778 insertions(+), 7 deletions(-)  create mode
> > > 100644 admin-cmds-device-parts.tex  create mode 100644
> > > device-parts.tex
> > 
> > 
> > Parav, makediff fails. Did you, in fact, run make diff and inspect the changes?
> > Because it's not really practical to review the whole document each time ...
> > 
> Without your last commit of makediff [1],
> 
> I ran makediffpdf and verified the output as well.
> There are some warnings with xtabular. I will fix them.
> 
> Makediffhtml.sh didn't succeed due to missing xtabular.
> I sent the fix [2] for it.
> 
> However, with commit [1], hitting below error for makediffpdf.sh and makediffhtml.sh too.
> 	
> HEAD is now at b495841 transport-mmio: fix up makediff from 1.2
> Applying editorial: allow for longer device id table: makediff 1.3
> [detached HEAD d213eb3] editorial: allow for longer device id table: makediff 1.3
>  Author: Cornelia Huck <cohuck@redhat.com>
>  Date: Mon Oct 30 14:42:05 2023 +0100
>  1 file changed, 2 insertions(+), 2 deletions(-)
> Applying admin: Prepare table for multipage listing
> Auto-merging makediff.sh
> CONFLICT (content): Merge conflict in makediff.sh
> error: could not apply c69ccb2... makediff: cherry pick table env change
> hint: After resolving the conflicts, mark them with
> hint: "git add/rm <pathspec>", then run
> hint: "git cherry-pick --continue".
> hint: You can instead skip this commit with "git cherry-pick --skip".
> hint: To abort and get back to the state before "git cherry-pick",
> hint: run "git cherry-pick --abort".
> 
> [1] https://github.com/oasis-tcs/virtio-spec/commit/c69ccb2f16e09e5dab9b9399b72b701d51f26b6a
> [2] https://lore.kernel.org/virtio-comment/20240714221837.3323459-1-parav@vr-arch-host06.mtvr.labs.mlnx/T/#u
> 
> > --
> > MST


OK I figured it out.
It's because you have the xtabular commit in there.
cherry-pick logic was picking it up because it
included the Fixes tag for the subject it was looking for.
For now I just switched it to looking for a regexp and added ^
in front. Will break if we have commits with special
characters in the subject, but we'll worry about it if
this occurs.

-- 
MST

