Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCFB74079
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721390837; cv=none; b=fRVuCmbABPCn9LHTB5mOzkcYys7MHYBXFP67KAPQQ9Z0RdRmxUG/n7vtNYWgg6T2vn+J8BslnKwYCmviT306HinBShAycxP1BlAnbNIc7dyLP6PvenGCOE7I49hJNAfkm3akHhW2zpErfgx3oSd6cFP/G9PRh20YLckhFsL7V4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721390837; c=relaxed/simple;
	bh=jY1WpSPtWsiiQEtUXVmZfilXl2tNKZ+r0LWrpVip0MY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uqnbtl3w+bJbhiaXKpUNXSK4tRrUHjrE3w766SqKxDWJmk+efdzR64hc9A2orYs+FBnffsH+ih6ITQgX5yJ9XSIIaRHnrDYifXAZO2hzje/b9NWltBP4h/ckFHTQAhVrdEcyusEoHy0OWEihMx+mAx6to3ElI0OtsUoS6thA8Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O1nj/3QD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O1nj/3QD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721390834;
	bh=jY1WpSPtWsiiQEtUXVmZfilXl2tNKZ+r0LWrpVip0MY=;
	h=From:To:Subject:Date:From;
	b=O1nj/3QDhHlFNT19/4njyhDAnEyBub/c69XYc4Z3gx+ZTMs8FTydnw+CgYWi8UCnZ
	 1SED9Mj5YWsqwyXztAkfEiUYlltH2UqjJW0TJT1FHDvI6BA0BWMAkudQQ8FqlpfNky
	 AoVSi0Y63PYZadHSS4yHgGWkmnsv6BFPmOfkovCYUHzDqk+ApwwwTIiTF7bQMfmiwP
	 akSSdSXoR8PdYGzodoKvBnaTfZ6OW5crBaC73GML4YtuYbkCtDTAgh8Sat6o8LjYta
	 H+bcViZgGxQEjTkgfhVA7boSdqDO5JeDn6Z76lBEznYkOBUmzYXRQkNYrS3us5nflv
	 aNQ5oh6dj4rRQ==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D2B1B378213C;
	Fri, 19 Jul 2024 12:07:13 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Huang Rui <ray.huang@amd.com>,
	Sergio Lopez <slp@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	virtio-comment@lists.linux.dev,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 0/3] VirtIO-GPU spec improvements
Date: Fri, 19 Jul 2024 15:06:34 +0300
Message-ID: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a repost of v2 to the new virtio-comment mailing list.
Michael Tsirkin suggested to repost the patches, here they are.

Dmitry Osipenko (3):
  virtio-gpu: Rename GFXSTREAM context capset to GFXSTREAM_VULKAN
  virtio-gpu: Document VIRTIO_GPU_CAPSET_DRM
  virtio-gpu: Update venus-protocol URL

 device-types/gpu/description.tex | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.45.2

