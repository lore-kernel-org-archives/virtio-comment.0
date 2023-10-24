Return-Path: <virtio-comment-return-7935-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F020BC07545
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:27:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 55A7D774EE
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:27:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F8C69869AB
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:27:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 11EEE98699F; Tue, 24 Oct 2023 10:27:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01CE69869A0
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 10:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="367255232"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208,217";a="367255232"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="932002080"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208,217";a="932002080"
Content-Type: multipart/alternative;
 boundary="------------b0BIRwhRb0hHVbh5hdv00VjM"
Message-ID: <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
Date: Tue, 24 Oct 2023 18:27:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
 <20231023072519-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231023072519-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

--------------b0BIRwhRb0hHVbh5hdv00VjM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/23/2023 7:32 PM, Michael S. Tsirkin wrote:
> On Mon, Oct 23, 2023 at 06:03:10PM +0800, Zhu, Lingshan wrote:
>> config space, MMIO, registers work for years, what is wrong with them?
> Nothing as such. They don't seem to be appropriate for all use-case
> where people want to utilize virtio. I think a new transport
> will be needed to address these.
New transport for new type of devices for sure, like transport vq for SIOV.

I agree admin vq or admin cmds are useful in some use cases, that is
another story, should be case by case.

For now, let's don't talk about all-use cases, just for current task, 
for live migration.

So IMHO, I still think we should use config space registers to control 
live migration process.
>
>>>> Config space is control path, DMA is data-path, let's better not mix them,
>>>> we never expect to use config space to transfer data.
>>>>
>>>> So we need DMA to transfer data, for example I take advantages of device DMA
>>>> to logging dirty pages, This also applies to in-flight descriptors.
>>> As long as you do, I personally see little benefit to retrieve parts of
>>> state with memory mapped accesses.
>> registers only control, and I personally believe a single register is much
>> better
>> than processing admin commands, more light-weight, more reliable, working
>> for years.
> Yea. It would be, if we could do everything through that register.
> But we can't really. Migration has too much data to pass around
> for that to be reasonable.
data are not transferred by registers, they only control.

We transfer data by DMA, the device writes DMA dirty pages 
information(bitmap)
to host isolated memory region.
>
>> Config space interfaces are fundamental for virtio-pci.
>
> They are in fact fundamental to virtio. Multiple transports to
> use config space are also fundamental.
I agree. So I also agree to build admin vq live migration solution based 
on our
basic facilities, as Jason ever proposed.
>
>
>>>> And we are implementing virito live migration, not only for PCI.
>>>>
>>>> So both me and Jason keep repeating: We are implementing basic facilities,
>>>> and the implementation is transport specific.
>>> But the register based facilities you proposed are extremely limited and
>>> seem to only work for migration. For example, it seems mostly useless for
>>> debugging because retrieving state is rather complex and would
>>> interfere with normal working of the device.
>> If you want to prove the register controlling interfaces are extremely
>> limited than admin vq or admin cmds,
>> you are also proving config space registers are extremely limited than
>> admin vq.
> Yes. Migration needs ability to pass large amounts of data around, and
> is too complex a functionality to work reliably without ability to
> report errors.
what errors? when device DMA?
missing some dirty pages? If the device can detect such errors, it can 
recover by itself,
or how can driver fix this?

for control path, virtio uses re-read for many years and it works well. 
I believe we have
went through this issue before.

>
>> So the question still here: do you want to replace current virtio-pci common
>> cfg
>> with admin vq or admin cmds?
> I think we need to add a new transport that will use admin commands.
> Which one to use would be up to a specific device.
For new device type like SIOV, yes we need a new transport, transport vq.

Let's focus on this live migration feature, if there are new features in 
the future
requires admin vq, let's discuss when they proposed.
>
>
>> And debug what? If you want to introduce more functionalities, we should
>> discuss
>> case by case.
>>
>> If debugging vq state, it is as easy as read queue_size, I don't see the
>> limitations
>> as queue_size work for years.
> No one reads queue_size. In fact for years we didn't have any debugging
> functionality and we are fine. If we are adding it, it really needs to
> be accessible when driver and device are wedged.
OK, I don't disagree to implement new device debugging features.

But let's focus on current live migration task.
>
>
>> I still believe our goal is to do our best, with our capabilities, to build
>> the most optimal virtio spec
>> as we can do. Not other goals.
>>
>> Thanks
>> Zhu Lingshan
>>>
>>>> We have proposed to build admin vq based on our register solution, this can
>>>> somehow even help tp resolve the nested issue.
>>>>
>>>> But I see the proposed has been rejected.
>>>>
>>>> I still believe the goal is to build a best spec, not "just can work" with
>>>> limitations.
>>>>
>>>>
>>>>

--------------b0BIRwhRb0hHVbh5hdv00VjM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace"><br>
      <br>
    </font>
    <div class="moz-cite-prefix"><font face="monospace">On 10/23/2023
        7:32 PM, Michael S. Tsirkin wrote:<br>
      </font></div>
    <blockquote type="cite"
      cite="mid:20231023072519-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Mon, Oct 23, 2023 at 06:03:10PM +0800, Zhu, Lingshan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">config space, MMIO, registers work for years, what is wrong with them?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Nothing as such. They don't seem to be appropriate for all use-case
where people want to utilize virtio. I think a new transport
will be needed to address these.</pre>
    </blockquote>
    <font face="monospace">New transport for new type of devices for
      sure, like transport vq for SIOV.<br>
      <br>
      I agree admin vq or admin cmds are useful in some use cases, that
      is<br>
      another story, should be case by case.<br>
      <br>
      For now, let's don't talk about all-use cases, just for current
      task, for live migration.<br>
      <br>
      So IMHO, I still think we should use config space registers to
      control live migration process.<br>
    </font><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20231023072519-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Config space is control path, DMA is data-path, let's better not mix them,
we never expect to use config space to transfer data.

So we need DMA to transfer data, for example I take advantages of device DMA
to logging dirty pages, This also applies to in-flight descriptors.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">As long as you do, I personally see little benefit to retrieve parts of
state with memory mapped accesses.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">registers only control, and I personally believe a single register is much
better
than processing admin commands, more light-weight, more reliable, working
for years.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yea. It would be, if we could do everything through that register.
But we can't really. Migration has too much data to pass around
for that to be reasonable.</pre>
    </blockquote>
    <font face="monospace">data are not transferred by registers, they
      only control.<br>
      <br>
      We transfer data by DMA, the device writes DMA dirty pages
      information(bitmap)<br>
      to host isolated memory region.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231023072519-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Config space interfaces are fundamental for virtio-pci.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

They are in fact fundamental to virtio. Multiple transports to
use config space are also fundamental.</pre>
    </blockquote>
    <font face="monospace">I agree. So I also agree to build admin vq
      live migration solution based on our<br>
      basic facilities, as Jason ever proposed.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231023072519-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">And we are implementing virito live migration, not only for PCI.

So both me and Jason keep repeating: We are implementing basic facilities,
and the implementation is transport specific.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">But the register based facilities you proposed are extremely limited and
seem to only work for migration. For example, it seems mostly useless for
debugging because retrieving state is rather complex and would
interfere with normal working of the device.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">If you want to prove the register controlling interfaces are extremely
limited than admin vq or admin cmds,
you are also proving config space registers are extremely limited than
admin vq.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes. Migration needs ability to pass large amounts of data around, and
is too complex a functionality to work reliably without ability to
report errors.</pre>
    </blockquote>
    <font face="monospace">what errors? when device DMA?<br>
      missing some dirty pages? If the device can detect such errors, it
      can recover by itself,<br>
      or how can driver fix this?<br>
      <br>
      for control path, virtio uses re-read for many years and it works
      well. I believe we have<br>
      went through this issue before.<br>
       </font><br>
    <blockquote type="cite"
      cite="mid:20231023072519-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So the question still here: do you want to replace current virtio-pci common
cfg
with admin vq or admin cmds?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think we need to add a new transport that will use admin commands.
Which one to use would be up to a specific device.</pre>
    </blockquote>
    <font face="monospace">For new device type like SIOV, yes we need a
      new transport, transport vq.<br>
      <br>
      Let's focus on this live migration feature, if there are new
      features in the future<br>
      requires admin vq, let's discuss when they proposed.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231023072519-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">And debug what? If you want to introduce more functionalities, we should
discuss
case by case.

If debugging vq state, it is as easy as read queue_size, I don't see the
limitations
as queue_size work for years.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No one reads queue_size. In fact for years we didn't have any debugging
functionality and we are fine. If we are adding it, it really needs to
be accessible when driver and device are wedged.</pre>
    </blockquote>
    <font face="monospace">OK, I don't disagree to implement new device
      debugging features.<br>
      <br>
      But let's focus on current live migration task.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231023072519-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I still believe our goal is to do our best, with our capabilities, to build
the most optimal virtio spec
as we can do. Not other goals.

Thanks
Zhu Lingshan
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">We have proposed to build admin vq based on our register solution, this can
somehow even help tp resolve the nested issue.

But I see the proposed has been rejected.

I still believe the goal is to build a best spec, not "just can work" with
limitations.



</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <font face="monospace"><br>
    </font>
  </body>
</html>

--------------b0BIRwhRb0hHVbh5hdv00VjM--
