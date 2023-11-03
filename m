Return-Path: <virtio-comment-return-8158-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAF4C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:33:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AB4913357B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:33:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AA45986C43
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:33:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E30FF986C3B; Fri,  3 Nov 2023 14:33:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0289986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 14:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387842965"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208,217";a="387842965"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832137"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208,217";a="1008832137"
Content-Type: multipart/alternative;
 boundary="------------1zcIQIMi0NylBo0Tygi0DPSr"
Message-ID: <a9103f82-c95e-47a6-9284-667c1c991aba@intel.com>
Date: Fri, 3 Nov 2023 22:32:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231103064730-mutt-send-email-mst@kernel.org>
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

--------------1zcIQIMi0NylBo0Tygi0DPSr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/2023 6:50 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
>> +\item[\field{bitmap_addr}]
>> +	The driver use this to set the address of the bitmap which records the dirty pages
>> +	caused by the device.
>> +	Each bit in the bitmap represents one memory page, bit 0 in the bitmap
>> +	reprsents page 0 at address 0, bit 1 represents page 1, and so on in a linear manner.
>> +	When \field{enable} is set to 1 and the device writes to a memory page,
>> +	the device MUST set the corresponding bit to 1 which indicating the page is dirty.
>> +\item[\field{bitmap_length}]
>> +	The driver use this to set the length in bytes of the bitmap.
>> +\end{description}
>> +
>> +\devicenormative{\subsubsection}{Memory Dirty Pages Tracker Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory Dirty Pages Tracker Capability}
>> +
>> +The device MUST NOT set any bits beyond bitmap_length when reporting dirty pages.
>> +
>> +To prevent a read-modify-write procedure, if a memory page is dirty,
>> +optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1.
>> +
>> +The device MAY increase \field{gra_power} to reduce \field{bitmap_length}.
>> +
>> +The device must ignore any writes to \field{pasid} if PASID Extended Capability is absent or
>> +the PASID functionality is disabled in PASID Extended Capability
>
> I have to say this is going to work very badly when the number of dirty
> pages is small: you will end up scanning and re-scanning all of bitmap.
The driver needs to scan anyway, Intel production work with similar 
bitmap based dirty page tracking solution for years.

Otherwise the device should report PFN which is not very practical.
> And the resolution is apparently 8 pages? You have just multiplied
> the migration bandwidth by a factor of 8.
No, as described in the comments, the tacking granularity is controlled 
by \field{gra_power}, one bit represents a page with page_size = 2^(12 + 
gra_power). This can also be used to reduce the size of the bitmap.

"To prevent a read-modify-write procedure, if a memory page is dirty,
optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1."

This is optional and DMA is very likely to write a neighbor page, and the device transmit a whole byte anyway
when a bit is dirty.

How about we use platform dirty page tracking facility then implement this in virtio, as Jason suggested?

>

--------------1zcIQIMi0NylBo0Tygi0DPSr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace"><br>
      <br>
    </font>
    <div class="moz-cite-prefix"><font face="monospace">On 11/3/2023
        6:50 PM, Michael S. Tsirkin wrote:<br>
      </font></div>
    <blockquote type="cite"
      cite="mid:20231103064730-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+\item[\field{bitmap_addr}]
+	The driver use this to set the address of the bitmap which records the dirty pages
+	caused by the device.
+	Each bit in the bitmap represents one memory page, bit 0 in the bitmap
+	reprsents page 0 at address 0, bit 1 represents page 1, and so on in a linear manner.
+	When \field{enable} is set to 1 and the device writes to a memory page,
+	the device MUST set the corresponding bit to 1 which indicating the page is dirty.
+\item[\field{bitmap_length}]
+	The driver use this to set the length in bytes of the bitmap.
+\end{description}
+
+\devicenormative{\subsubsection}{Memory Dirty Pages Tracker Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory Dirty Pages Tracker Capability}
+
+The device MUST NOT set any bits beyond bitmap_length when reporting dirty pages.
+
+To prevent a read-modify-write procedure, if a memory page is dirty,
+optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1.
+
+The device MAY increase \field{gra_power} to reduce \field{bitmap_length}.
+
+The device must ignore any writes to \field{pasid} if PASID Extended Capability is absent or
+the PASID functionality is disabled in PASID Extended Capability
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

I have to say this is going to work very badly when the number of dirty
pages is small: you will end up scanning and re-scanning all of bitmap.</pre>
    </blockquote>
    <font face="monospace">The driver needs to scan anyway, Intel
      production work with similar bitmap based dirty page tracking
      solution for years.<br>
      <br>
      Otherwise the device should report PFN which is not very
      practical.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231103064730-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">
And the resolution is apparently 8 pages? You have just multiplied
the migration bandwidth by a factor of 8.</pre>
    </blockquote>
    <font face="monospace">No, as described in the comments, the tacking
      <span style="white-space: pre-wrap">granularity is controlled by
</span><span style="white-space: pre-wrap">\field{gra_power}, one bit represents a page with page_size = 2^(12 + gra_power).
This can also be used to reduce the size of the bitmap.</span></font><br
    style="white-space: pre-wrap;">
    <pre class="moz-quote-pre" wrap="">"To prevent a read-modify-write procedure, if a memory page is dirty,
optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1."

This is optional and DMA is very likely to write a neighbor page, and the device transmit a whole byte anyway
when a bit is dirty.

How about we use platform dirty page tracking facility then implement this in virtio, as Jason suggested?
</pre>
    <blockquote type="cite"
      cite="mid:20231103064730-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
    <font face="monospace"><br>
    </font>
  </body>
</html>

--------------1zcIQIMi0NylBo0Tygi0DPSr--
