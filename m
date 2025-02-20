Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DEE29406
	for <virtio-comment@lists.linux.dev>; Thu, 20 Feb 2025 02:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740017772; cv=pass; b=eDDMrtpetKyAn1fIyqVOIdCx682wetlHqQTJ8Y4uvalcQQxPvjleFYWu3SOwTpaIfxyQRrt+FTaYfBxd+n/Hiz8Q4KgGl9ZmLflx+aKRhOp2g7DR2oonAIii0fQwWAYVFG3vYGMgXkWKBlpol7QV98/aAuh/nmjtTS7E+DDAvO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740017772; c=relaxed/simple;
	bh=qGVkHDtjEtijiYQKfkOSb3Gpa+4MSbAulFjzhnX0N5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PzicgAtkB2Q1ppLNrMOnU9u50cW2JTvS/AiF2BfxvXJoZTY63L3/6wvKvMdZv6cwifyqJDGsVVQXCYKNpfDh1GLoVqK+yggBzO+o+C5C36VR8AMx5IoETRwgKj/rVwNmaqKUw+7NhUlcaa32lW7UA820MC/bUm98SLJ+dZC4XQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=dQs/uzII; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="dQs/uzII"
ARC-Seal: i=1; a=rsa-sha256; t=1740017761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e4XUpYY9qmyP+36fFKf0AQviqo0MIGyycpzZcR5euxzhQ/AoRgyzX8J4qcukbgdR+RiJl7lmGkUEpfmLBmoPFODyP0BQ5aO971unLICGnPxhaiSBRGRv6UkCXi6kynFwc86vmG01O7B5nR426eQSmaL1/K47S/M9MKBorNzR90Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740017761; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Ega+TTtHZP9YjWKgSs6JOUHNnY3PBBZQMlXxX3Kij7o=; 
	b=XxzpT7MhCtRPrwO80FFQMs4qQ2ICFp1f5Ge8d/8/5xSPc+qYPV+s2DvCTKhDZJ1RNItNCKHEKPXgZvQ+Y8avklwIwEHsNGjeuR4M9rw7+8j7jwZuueN8Koc4IW4lLy8tpV9EQxRhc3mk1HiJLvwtlqtkToCTaULoxreQTVjrrys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740017761;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Ega+TTtHZP9YjWKgSs6JOUHNnY3PBBZQMlXxX3Kij7o=;
	b=dQs/uzII8GJ2HDNVTvslleFvfZjIsK2fEUr5utZFBMSXe+6Nx504JJNynML8eCwF
	XQFtZRmtKfDOVuDyF89TY9LNveAxO+GQkxl5y+aga3jGBWlQUz63X/xZkQzVYxfqnpO
	/WxGvkL8+slQq1g7r+w8kMzdZOZWmusiAA1wkcFQ=
Received: by mx.zohomail.com with SMTPS id 1740017760122648.3710006273835;
	Wed, 19 Feb 2025 18:16:00 -0800 (PST)
Message-ID: <00728521-5e8b-40dc-9663-5b9374b1f0b3@collabora.com>
Date: Thu, 20 Feb 2025 05:15:57 +0300
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] shared-mem: introduce page alignment restrictions
To: Sergio Lopez <slp@redhat.com>, virtio-comment@lists.linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250217115227.4961-1-slp@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250217115227.4961-1-slp@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/17/25 14:52, Sergio Lopez wrote:
> There's an incresing number of machines supporting multiple page sizes
> and, on these machines, the host and a guest can be running with
> different pages sizes.
> 
> In addition to this, there might be devices that have a required and/or
> preferred page size for mapping memory.
> 
> In this series we extend the "Shared Memory Regions" with a subsection
> explaining the posible existence of page alignment restrictions.
> 
> For the device to provide the page size information to the driver, we
> need to extend the PCI and MMIO transports. For the former, we borrow
> 8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
> field which can be used to derive the page size by using the following
> formula: (page_size = 1 << (page_shift + 12)).
> 
> For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
> holding the page_shift value. Since MMIO registers are 32 bit wide, we
> could have asked the device to directly provide page_size instead of
> page_shift, but seems reasonable to be consistent across transports.
> 
> Since accessing a new MMIO register could be interpreted by the device
> as an error, this behavior is gated behind the newly introduced
> VIRTIO_F_SHM_PAGE_SIZE feature bit.
> 
> An implementation of the changes proposed in this series has been
> published as an RFC to the LKML, to be used as a reference:
> 
> https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com/
> 
> Sergio Lopez (3):
>   shared-mem: introduce page alignment restrictions
>   transport-pci: VIRTIO_F_SHM_PAGE_SIZE support
>   transport-mmio: VIRTIO_F_SHM_PAGE_SIZE
> 
>  content.tex        |  3 +++
>  shared-mem.tex     |  7 +++++++
>  transport-mmio.tex |  8 ++++++++
>  transport-pci.tex  | 10 +++++++++-
>  4 files changed, 27 insertions(+), 1 deletion(-)
> 

Looks good

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>


-- 
Best regards,
Dmitry
