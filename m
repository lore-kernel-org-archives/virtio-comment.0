Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC016E896
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718194823; cv=none; b=Hl2fq4d3I+ypzXrPQJy0o1rvpwzpSghSl7Q/UIZnCX5embygkSHMjjSYDD+N0tRA7pMKZqEB8s9OOyIPclE6HA8LJvlNlHlsztRFTSyp4L10LYW2zdQCYx+An7odVroENDJAR6ZDWBzvcVHKrZnHE4FrJSEr281AkARII+fneJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718194823; c=relaxed/simple;
	bh=arsiaKsz5CZISnau4J6UMM2tiymkDebqMIlhiOq1AJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YWRpHF6fRB+s43wnueRFPOvnekU8ctcVK1ityleMZXk/JbstY0mApmjetcI/T8+NKsIT+fo3Pz7gLvYsDslo68Th5zXRVZIRXGoQrCgqo7gY82SJidgIqOu1rk8DdVqWFYglBobGEf+2Zr0jGSGdkMndDslvC9Wjoeey1zHikSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DOGpbffC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DOGpbffC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718194821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PObUX45n6gufaeQcQL3g0uj+CFKM6axW6xNFTIX31WE=;
	b=DOGpbffCIXl3IKpY5c5AiTY0qm4YGMRC9QmIdLcr8X+k+Z3lcZGMWyhPCn0tDepNCdHbl/
	VGpo5Ryj2xiAHhR7CjLKbPLU6+2ZzqPhHQE3jpmZYTZAp+1EEeC4iFc8EJ+1y8RV/bfZsj
	U42wQvWH0LL8onlMV+qIsr5ajPwJETE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-8UZgXlraMNeCOoac3ClraQ-1; Wed, 12 Jun 2024 08:20:19 -0400
X-MC-Unique: 8UZgXlraMNeCOoac3ClraQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4217f941ca8so25114085e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 05:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718194818; x=1718799618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PObUX45n6gufaeQcQL3g0uj+CFKM6axW6xNFTIX31WE=;
        b=gLyNRsp/h7wwF2s53QhLNEplEJJfV7KP7gFP/IZt+JD/VT67YFMcE8B8E3ct/fPGYk
         /ZcSTneMXKBRmZL8YssfnF/msE6KYOzWtZy8Q1rHWapXbZDicmjlqf+CYz1BdPgzLxDG
         55+VDtoQwAuvYmoWGrilRrbbv4sFyypLhrwAZNUZfeNAPIMDHdb+UQn6PXBe4HyTjD7e
         OIeYZ9C0qblKhn18ov8vfOWSrg8VoppjJ6iXoyx5Z3ap9nrKNxXw3QkVN2Nmxeu//pF2
         2pQBoDOKs7n9q/AO1eB9AoB6v2zmiQ0iLiUWPgcp1hR8MeP5V1cI+Nu33s1RNZH+l6Tb
         vAsA==
X-Forwarded-Encrypted: i=1; AJvYcCWYGIbirxfoZn+uXo5KShQdZe7IbNd6c48T3eBgr43ps+rMq/AqRN4W1I2RvMYfgL295kRmdsjiSdYdmSuYgSSATmPfNeRacgYYQODAFYU=
X-Gm-Message-State: AOJu0YwvnI8ltEfbbx8SiqAKCXF5HKyH+U4nCVJnFAAwwFppQ52DLuj/
	8On16cJjx6BLpnTrPS/tYIdxpFUkrZDVi4on53m5vOMcRNK0UBHLRSaYIMODOHOj96L/Oa965Rg
	bKTd0Mvqk/y1ju6FkzFr34fkNMmKfq2lwo80hNKq36lYLb/115/rVBsypyEUOMdV0
X-Received: by 2002:a05:600c:4fc9:b0:422:6407:5caa with SMTP id 5b1f17b1804b1-422a09dbfb9mr3353145e9.33.1718194818329;
        Wed, 12 Jun 2024 05:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEps+f0P10DzhMt82ZeJN+tuTtSyJnxBfFji3yAdxPfa7jcRXRsBtNm1foXnYJHMUbZYr9VNw==
X-Received: by 2002:a05:600c:4fc9:b0:422:6407:5caa with SMTP id 5b1f17b1804b1-422a09dbfb9mr3352905e9.33.1718194817806;
        Wed, 12 Jun 2024 05:20:17 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:39eb:4161:d39d:43e6:41f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871eb9ecsm25097085e9.35.2024.06.12.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:20:17 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:20:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Cornelia Huck <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
Message-ID: <20240612081135-mutt-send-email-mst@kernel.org>
References: <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
 <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
 <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 11:26:39AM +0000, Parav Pandit wrote:
> No locks are needed. Hypervisor is accessing the admin vq on the PF.

I'm not even going to try and get through a jumble of this thread
heavily corrupted by outlook and whatnot, but from the glimpses I got
this discussion looks like just two people talking past each other.
Lingshan, Parav's not the only one bothered by how the device seemingly
has to block a transaction until it completes suspend. Parav, I feel how
to address this is up to the author to resolve really, leave it at that.

Thanks,

-- 
MST

