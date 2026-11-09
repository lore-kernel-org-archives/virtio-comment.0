Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.218.115.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247172;
	b=OenLgKGwckDuo5JaEWVRaFmJ7ymPF8CXIJcWeLUu5ZJhRZxyaXbVijQ/8G1HsID0mOT/
	 9jaaiTwqD1IHRb/LXhDlp4Cut14NYEZFGF1p4T4orPL/2SdsdcgEpo569T4v4MuDjJFdl
	 hS0TiW9/c78vO26juRerOkdkZuQN4JiaqHXfJ0JX89J2qIBbySNwkaHFkOl1zg1TZau1D
	 mHcB3eDe3lsi8s2IR2mRbhE7+RmniZv7OhAJxkH6CXESDSiv5JpMKME61hIOTCv4Hukye
	 +RRuHDeyCnImDeaTiYIhuH+zEnzlSrtT/wjhrBWBT1oWZH6+6EMnhQOAEjSQnWKVG2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247172;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=SAguVTwrdsMjYAAO6E46fCFdb2xg4/o2zzKsE+M1PgM=;
	b=L0+nYexNgAjRGSMi+/Dt9XeZIoconl2T2cM2ACz56aXchJU/JqHT82s0c1qg/gVVrfYG
	 TJ64JZZdLNszufStq4pJNuxVll2l4c5OhLrIKpz+dcA/8jGXmNsgQbSde2JUAxZ+LR6hf
	 s3umGczlyt80Xpk/qC9onTZrspycdQXicLERFlg71yIJSl/eRCKoBnjPvz5uIOXU5Pro7
	 y8a2C9ttKEniB2JsIvvfh/KefAwALvu9BxpCjoND7dAjGHlQtfuinjWXk9vI2KAyQNHTI
	 zsrKgKJFOzstCuydns5eJrwEc/rr4fIv7wyh7hgNzZp/EClmbGBHnhmmAL7npgALkIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.co.uk;
	spf=pass smtp.mailfrom=amazon.co.uk;
	dkim=pass header.d=amazon.co.uk header.i=@amazon.co.uk header.a=rsa-sha256 header.s=amazoncorp2 header.b=KaTK2MKR;
	arc=none smtp.remote-ip=34.218.115.239
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94624606A330
	for <virtio-comment@lists.linux.dev>; Mon,  9 Nov 2026 17:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94624606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.co.uk header.i=@amazon.co.uk header.a=rsa-sha256 header.s=amazoncorp2 header.b=KaTK2MKR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1794247171; x=1825783171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SAguVTwrdsMjYAAO6E46fCFdb2xg4/o2zzKsE+M1PgM=;
  b=KaTK2MKR0WUfHXvPVkS5gIPB59Crt5dadjwWPq/UmwuqiYsCyLgOl2sx
   AnX/zgU2UrSIwFWGKtfwx6pZ4PO0FITJ4VdR+BYEkxW7+mJUBm77YI+gb
   iLYVE+5nFevVNJ4G8XU7pETy9iY2rZ0jTjyK1C9hixwTo0pce55UsVoa5
   Bng2f1oG+pkKBjGQJy3DaqF94llXBYLqBjKR8sZE/YkWshqGUolMcGTn3
   MHrwCIuLnouzqkiC+yiDfjUZiaWnUP7OghW+vL4pHHJx8S7aLynsjRytb
   U1qF1+yPE1m+3qlc+nqAUp7qlWS/WGh4N8NyU+1qLC6fjUOYYJkPbPzy3
   Q==;
X-CSE-ConnectionGUID: lKR5l7l+T2qVCg7z89wIUA==
X-CSE-MsgGUID: QS3NtNmNQzqfoW7EFalKvA==
X-IronPort-AV: E=Sophos;i="6.27,204,1787011200"; 
   d="scan'208";a="33315366"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 17:59:28 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:10894]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id 61675b9f-cbec-4343-80cd-0bfbb00798fb; Mon, 9 Nov 2026 17:59:28 +0000 (UTC)
X-Farcaster-Flow-ID: 61675b9f-cbec-4343-80cd-0bfbb00798fb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 9 Nov 2026 17:59:28 +0000
Received: from 842f578aa477.amazon.com (10.106.83.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 9 Nov 2026 17:59:26 +0000
From: Jasper Wise <jaspwise@amazon.co.uk>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Alexander Graf <graf@amazon.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	<nh-open-source@amazon.com>
Subject: Re: [PATCH v5] Add VIRTIO_F_DMB (Device Memory Buffer)
Date: Mon, 9 Nov 2026 17:59:00 +0000
Message-ID: <20261109175900.53126-1-jaspwise@amazon.co.uk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asUrGB7-_YZ0x56o@redhat.com>
References: <asUrGB7-_YZ0x56o@redhat.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 06.10.26 19:08, Matias Ezequiel Vara Larsen wrote:

Hi Matias,

Thanks a lot for the review! I have taken over the DMB series from Alex.
Most of this is folded into v6, which is now on the list:
https://lore.kernel.org/virtio-comment/20261109143451.60558-1-jaspwise@amazon.co.uk/

>> A driver that has not negotiated VIRTIO_F_ACCESS_PLATFORM otherwise has to
>> pass only physical addresses, so VIRTIO_F_DMB is an exception to that.
>
> There are some places in the spec that talks about the address in the
> virtqueue as physical addresses, e.g., queue_desc. Shall we add that the
> meaning of those fields changes when VIRTIO_F_DMB has been negotiated?

Yes, good catch. There are quite a few of them: the descriptor addr
field in both ring layouts, queue_desc/queue_driver/queue_device on PCI
and the QueueDesc/Driver/Device registers on MMIO. Instead of touching
every one of them, v6 adds a single rule to the DMB section: once the
feature is negotiated, any virtqueue or buffer address the spec
describes as physical is a bus address into the DMB, on both the driver
and the device side. The only exception is addresses a device type uses
as messages about guest memory, like balloon PFNs. v6 calls those out in
a separate sentence. VIRTIO_F_ACCESS_PLATFORM already turns the same
fields into bus addresses without editing each one.

>> +the device designates exactly one of its shared memory regions as the
>
> Should this be normative?

It already is, just in the transport sections: dmb_shm_id and DMBSHMId
are a single field each that MUST equal the id of one region, so a
device can't designate two. v4 had a generic copy of the rule in the
device requirements, but Michael asked for requirements the transport
sections already make to stay there, so v5 dropped it and I'd rather not
add it back.

>> +mechanism: \field{dmb_shm_id} in the common configuration structure on the
>
> Regarding the shmid, I am thinking on the case of virtio-gpu that
> defines two possible values for the shmid: 0 or 1. How would it work in
> this case?

Good point, and it's worse than it looks: the gpu section said every gpu
region's shmid MUST be 0 or 1, so a gpu device couldn't even pick a
different id for the DMB. scmi had the same problem, it classifies every
shmid value, naming some and reserving the rest. And v5 never said the
ids can't collide, only the commit message did.

v6 fixes both. The DMB shmid must differ from every other region of the
device and avoid every value its device type names, while values
reserved for future use stay available. The gpu and scmi sections also
exempt the DMB region from their shmid rules. So a gpu device keeps 0
and 1 for its own regions and reports something else, say 2, in
dmb_shm_id, even when it exposes no region of its own, and an scmi
device picks a value scmi reserves for future use, such as 4.

The shmid sits in static config, so a driver sees the DMB region before
it decides on the feature. In v6 the device designates the DMB as soon as
it offers VIRTIO_F_DMB and keeps it whether or not the driver accepts,
and dmb_shm_id is readable from then on, like dmb_mem_type.

>> +address space 1:1 onto the Device Memory Buffer region.  The mapping starts
>> +at the region's first byte and is as long as the region: bus address $N$
>> +resolves to the byte at position $N$ in the region, for every $N$ less than
>> +the region's length.  The device performs those accesses against the region
>
> I am confused with what is said below in the normative text regarding
> that the mapping does not cover the first 16 bytes of the region. Is it
> then the actual first byte of the region the 16th?

No, there is no shift. Bus address 16 is position 16 in the region.
Positions 0 to 15 exist, but no bus address reaches them, which is what
makes address 0 invalid. The text contradicted itself, which is where the
confusion came from: this paragraph said the mapping starts at the first
byte, the normative part said it skips the first 16. v6 describes it the
same way in both places, as bus address N at position N for every N from
16 up to the region's length.

Thanks,
Jasper
