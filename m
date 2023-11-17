Return-Path: <virtio-comment-return-8436-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF85C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:13:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DBE4F42A70
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:13:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A21FD986E25
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:13:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8BC33986E1A; Fri, 17 Nov 2023 10:13:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BB24986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="371455395"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208,217";a="371455395"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1097058229"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208,217";a="1097058229"
Content-Type: multipart/alternative;
 boundary="------------b0berctdbpCiiezwunzhbmSr"
Message-ID: <cd3e331c-8fc0-4f96-b049-dee3c09829c9@intel.com>
Date: Fri, 17 Nov 2023 18:13:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8e92a16e-2a5d-4c9c-bb85-5a5c6fecbe05@intel.com>
 <PH0PR12MB5481C31027CE6716503F3F24DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <a28b2c22-a03f-473d-b672-d54e0390b76a@intel.com>
 <PH0PR12MB5481ED082C94A9603DC6BDC8DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6949173c-29cf-4c49-af82-562c050e40ae@intel.com>
 <20231116070024-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231116070024-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

--------------b0berctdbpCiiezwunzhbmSr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/16/2023 8:09 PM, Michael S. Tsirkin wrote:
> On Thu, Nov 16, 2023 at 06:09:38PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/16/2023 1:35 AM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan<lingshan.zhu@intel.com>
>>>> Sent: Monday, November 13, 2023 2:53 PM
>>>>
>>>> On 11/10/2023 2:31 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan<lingshan.zhu@intel.com>
>>>>>> Sent: Friday, November 10, 2023 11:52 AM
>>>>>>
>>>>>> On 11/9/2023 6:15 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu, Lingshan<lingshan.zhu@intel.com>
>>>>>>>> Sent: Thursday, November 9, 2023 3:28 PM
>>>>>>>>
>>>>>>>> On 11/9/2023 1:46 AM, Michael S. Tsirkin wrote:
>>>>>>>>> On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu, Lingshan wrote:
>>>>>>>>>> On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>> On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
>>>>>>>>>>>> When SUSPEND is set, device states and virtqueue states should
>>>>>>>>>>>> be stablized, therefore the driver should not reset vqs when
>>>>>>>>>>>> SUSPEND is set in device status.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Zhu Lingshan<lingshan.zhu@intel.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>        content.tex | 3 +++
>>>>>>>>>>>>        1 file changed, 3 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/content.tex b/content.tex index bcc9d4b..060b5c2
>>>>>>>>>>>> 100644
>>>>>>>>>>>> --- a/content.tex
>>>>>>>>>>>> +++ b/content.tex
>>>>>>>>>>>> @@ -444,6 +444,9 @@ \subsubsection{Virtqueue
>>>>>>>>>>>> Reset}\label{sec:Basic
>>>>>>>> Facilities of a Virtio Device /
>>>>>>>>>>>>        The device MUST reset any state of a virtqueue to the default
>>>> state,
>>>>>>>>>>>>        including the available state and the used state.
>>>>>>>>>>>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in
>>>>>>>>>>>> +\field{device status}, the driver SHOULD NOT reset any virtqueues.
>>>>>>>>>>>> +
>>>>>>>>>>>>        \drivernormative{\paragraph}{Virtqueue Reset}{Basic
>>>>>>>>>>>> Facilities of a
>>>>>>>> Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>>>>>>>>>>>>        After the driver tells the device to reset a queue, the
>>>>>>>>>>>> driver MUST verify that
>>>>>>>>>>> Seems somewhat arbitrary and breaks the claim that the feature
>>>>>>>>>>> is orthogonal and can have uses besides migration.
>>>>>>>>>> when suspended, the device is frozen.
>>>>>>>>>> The driver is aware of this process and so should not reset the vqs I
>>>> think.
>>>>>>>>> Again that is only true because you want to use it for migration.
>>>>>>>>> But then you can't claim it's a generic facility.
>>>>>>>> I don't get it. The device status is a basic facility.
>>>>>>>>
>>>>>>>> We need to SUSPEND the device by setting SUSPEND bit, to stabilize
>>>>>>>> the device states for migration.
>>>>>>> Is the PCI's PM time not enough to suspend the device?
>>>>>>> For large device I could imagine it could be short.
>>>>>> As you see, PCI PM, so this is a layer violation, virtio should be
>>>>>> self contained,
>>>>> If you think it is layer violation, than suspend bit for sure is not needed. PCI
>>>> PM interface should suspend/resume the device on D0<->D3 state transitions.
>>>> Doesn't make sense logically, because it is layer violation, so you want it to be
>>>> worse? For example, virito writes 0 to device status to reset a device, not by PCI.
>>> All these layer violation thing is just abstract to me.
>>> Your argument contradicts with your fellow author and yourself.
>> I don't see how, we keep telling you virtio should be self contained, and
>> suspend by PCI PM is a
>> layer volition, this is a fact, right?
> Not really. Look at the charter - when available we should use platform
> capabilities because it makes it easier to write drivers.
I think that is transport specific implementation, for example pci 
common cfg.
>
>
>>> I don’t want to make it worse.
>>> If you think its layer violation, just depend on the PCI PM, no need to include new suspend bit.
>> Again, virtio should be self-contained, not layer volited, for example, we
>> reset virito devices
>> by writing 0 to device status, not by PCI FLR.
> There are some advantage to doing it like this, e.g. one does not need
> to save and restore config space. What are advatages of suspend via this
> bit?
suspend a device by the device status is the same as how we enable a 
virito device.

Doing this by PCI is clearly a layer volition, and does not work for 
other transports.
>
>>>>>> and what about MMIO and CCW?
>>>>> They have largely lacked the richness of PCI transport. So those transport
>>>> needs to evolve.
>>>> I am not sure CCW and MMIO maintainers want to hear this.
>>>>> Otherwise, PCI offers rich transport facilities compared to MMIO, hence, it will
>>>> continue wider use.
>>>> you know this SUSPEND bit work fine on all transport, right? Because
>>>> device_status is transport independent.
>>> I want to emphasize that I am not against the suspend bit as long as it is guest driver controlled without interfering the device migration flow (like rest of the state).
>> When migrate a device, it is the host who suspends the device. The reason is
>> the live migration process should be transparent to
>> the guest, so we should suspend the guest first, then suspend the device(by
>> host).
>>> The practical reason for suspending functionality under guest control is, that resuming/suspending the large device can take time.
>>> So let it be in guest driver control. No need to muddy with device migration flow.
>> The time cost is reasonable in O(N) no matter how you suspend/resume the
>> device.
> Very much depends. Big O notation can be misleading. If you have to
> repeat an operation 1000 times that's 1000 * N and suddenly you are
> going from milliseconds to seconds.
I mean enable 100 queues cost more time then enable 1 vq no matter
how we enable it. that is O(N)
>
>
>>>>>> This should be a basic facility.
>>>>> Other transport can also offer like PCI.
>>>> Do you want to work for these transport? Implementing the new features as
>>>> PCI?
>>> Not presently as PCI as more features than rest of the two.
>>> What I read about ccw is: " S/390 based virtual machines support neither PCI nor MMIO".
>>>
>>> And I also read, "The IBM System/390 is a discontinued mainframe product family implementing".
>>>
>>> So I don’t know who needs to extend ccw.
>>> And if one needs, those maintainers will extend it to match to PCI standard.
>> So these features are even not planned, so don't depend on them.
> But again can one suspend ccw device? If you are adding this feature and
> claiming it's supported for all transports you better find out
> what does it do.
I am not an expert on CCW, anything block we suspend a CCW device by 
this bit?
This seems only controlled by the device itself.
>
>
>>>>>>> In that case if there is suspend the device available, it will be
>>>>>>> used by the
>>>>>> guest driver itself, hypervisor wouldn’t know about it when those
>>>>>> registers are not trapped.
>>>>>>> So we need two ways to suspend.
>>>>>>> One is guest visible, and guest controlled.
>>>>>>> Second is hypervisor control to fulfill the device migration needs.
>>>>>> The guest can eve reset the device.
>>>>>>> So if you can please take a look if the proposed admin command to
>>>>>> freeze/stop mode can be used in the emulated register case or not.
>>>>>>> It helps to have the suspend bit in guest control as well
>>>>>>> with/without
>>>>>> emulation mode.
>>>>>> Parav, please believe I have read your series, I didn't comment there
>>>>>> because I want to avoid further conflicts/debating, we have done these
>>>> enough.
>>>>> I believe the series posted in v3 can support vdpa use case as well.
>>>>> So I will progress to post v4.
>>>>>
>>>>>> As explained before, freeze/stop the device by PCI is a layer violation.
>>>>> I am afraid, we have different vision.
>>>>> I don’t see any layer violation.
>>>>> Suspend is enough in the PCI PM.
>>>>> Our vision is more aligned with rest of the hypervisor knobs that owns the
>>>> migration framework.
>>>> I think I have explained, virito builds on other transport and it should be self-
>>>> contained, so far so good.
>>> Virtio without any transport binding is just blank paper discussion.
>> virtio is built on some transports, but not bind to any.
> Binding is an OS specific thing, but e.g. under Linux transport drivers bind to
> devices then virtio drivers bind to virtio bus. No binding -> nothing
> works.
I think general facilities are better not only work on a specific transport
>
>>>>>> And device status can be pass-through(without emulation, just map it
>>>>>> to
>>>>>> guest) to the guest or trapped(trap and emulate by the hypervisor,
>>>>>> for example set_status in vDPA).
>>>>> When it is pass-through, it is controlled by the guest, so for example, if the
>>>> guest resets the device, hypervisor has lost the control of migration context etc.
>>>>> Hence, hypervisor needs a channel which is not guest owned.
>>>>>
>>>>> Same channel can work when trap+emulation is done.
>>>> It is the guest owns the device, it can reset the device, once reset, the device
>>>> context are cleared.
>>> Hypervisor do not have the ability to read/write the device context. It lost the channel as hypervisor is not involved in trap+emulation.
>>> So it is not helpful in one use case.
>>>
>>> Admin commands can work even with trap+emulation mode.
>>>
>>> What is missing, that should be added?
>> as explained above, when live migration, the guest should be suspended
>> first, at this point,
>> the host owns the device, it has access to the device.
> Where do you say this in the spec patch?
VM live migration is not in this spec.
If we suspend the device first, then the guest may detect IO errors.
>
>
>>>>>>>> This can also be used for debugging I think.
>>>>>>> As Michael listed, a dedicated debug interface is usually more
>>>>>>> useful instead
>>>>>> of in-band.
>>>>>> re-using another facility without extra efforts is not a bad thing anyway.
>>>>> I just don’t see how a suspend bit some debug feature.
>>>>> Almost everything with that regard is a debug feature to me.
>>>> suspend then check the device states?
>>> You already suspended the device, so device state is already changed.
>>> All debug information is changed, so not useful now.
>> When suspended, the device should keep and stabilize its device states,
>> at least in my series it should behave like this.
> That's vague. What does it mean exactly and what happens if
> some external event causes state change?
it is suspended, somehow like powered-down, so it should not
respond to the events until resume.
>

--------------b0berctdbpCiiezwunzhbmSr
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
    <div class="moz-cite-prefix"><font face="monospace">On 11/16/2023
        8:09 PM, Michael S. Tsirkin wrote:<br>
      </font></div>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Thu, Nov 16, 2023 at 06:09:38PM +0800, Zhu, Lingshan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 11/16/2023 1:35 AM, Parav Pandit wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: Zhu, Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Monday, November 13, 2023 2:53 PM

On 11/10/2023 2:31 PM, Parav Pandit wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">From: Zhu, Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Friday, November 10, 2023 11:52 AM

On 11/9/2023 6:15 PM, Parav Pandit wrote:
</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">From: Zhu, Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Thursday, November 9, 2023 3:28 PM

On 11/9/2023 1:46 AM, Michael S. Tsirkin wrote:
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu, Lingshan wrote:
</pre>
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
</pre>
                        <blockquote type="cite">
                          <pre class="moz-quote-pre" wrap="">On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
</pre>
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">When SUSPEND is set, device states and virtqueue states should
be stablized, therefore the driver should not reset vqs when
SUSPEND is set in device status.

Signed-off-by: Zhu Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
---
      content.tex | 3 +++
      1 file changed, 3 insertions(+)

diff --git a/content.tex b/content.tex index bcc9d4b..060b5c2
100644
--- a/content.tex
+++ b/content.tex
@@ -444,6 +444,9 @@ \subsubsection{Virtqueue
Reset}\label{sec:Basic
</pre>
                          </blockquote>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Facilities of a Virtio Device /
</pre>
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <blockquote type="cite">
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">      The device MUST reset any state of a virtqueue to the default
</pre>
                          </blockquote>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">state,
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <blockquote type="cite">
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">      including the available state and the used state.
+If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in
+\field{device status}, the driver SHOULD NOT reset any virtqueues.
+
      \drivernormative{\paragraph}{Virtqueue Reset}{Basic
Facilities of a
</pre>
                          </blockquote>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
</pre>
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <blockquote type="cite">
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">      After the driver tells the device to reset a queue, the
driver MUST verify that
</pre>
                          </blockquote>
                          <pre class="moz-quote-pre" wrap="">Seems somewhat arbitrary and breaks the claim that the feature
is orthogonal and can have uses besides migration.
</pre>
                        </blockquote>
                        <pre class="moz-quote-pre" wrap="">when suspended, the device is frozen.
The driver is aware of this process and so should not reset the vqs I
</pre>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">think.
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">Again that is only true because you want to use it for migration.
But then you can't claim it's a generic facility.
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">I don't get it. The device status is a basic facility.

We need to SUSPEND the device by setting SUSPEND bit, to stabilize
the device states for migration.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">Is the PCI's PM time not enough to suspend the device?
For large device I could imagine it could be short.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">As you see, PCI PM, so this is a layer violation, virtio should be
self contained,
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">If you think it is layer violation, than suspend bit for sure is not needed. PCI
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">PM interface should suspend/resume the device on D0&lt;-&gt;D3 state transitions.
Doesn't make sense logically, because it is layer violation, so you want it to be
worse? For example, virito writes 0 to device status to reset a device, not by PCI.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">All these layer violation thing is just abstract to me.
Your argument contradicts with your fellow author and yourself.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I don't see how, we keep telling you virtio should be self contained, and
suspend by PCI PM is a
layer volition, this is a fact, right?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not really. Look at the charter - when available we should use platform
capabilities because it makes it easier to write drivers.</pre>
    </blockquote>
    <font face="monospace">I think that is transport specific
      implementation, for example pci common cfg.</font><br>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I don’t want to make it worse.
If you think its layer violation, just depend on the PCI PM, no need to include new suspend bit.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Again, virtio should be self-contained, not layer volited, for example, we
reset virito devices
by writing 0 to device status, not by PCI FLR.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There are some advantage to doing it like this, e.g. one does not need
to save and restore config space. What are advatages of suspend via this
bit?</pre>
    </blockquote>
    <font face="monospace">suspend a device by the device status is the
      same as how we enable a virito device.<br>
      <br>
      Doing this by PCI is clearly a layer volition, and does not work
      for other transports. <br>
    </font>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">and what about MMIO and CCW?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">They have largely lacked the richness of PCI transport. So those transport
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">needs to evolve.
I am not sure CCW and MMIO maintainers want to hear this.
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Otherwise, PCI offers rich transport facilities compared to MMIO, hence, it will
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">continue wider use.
you know this SUSPEND bit work fine on all transport, right? Because
device_status is transport independent.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I want to emphasize that I am not against the suspend bit as long as it is guest driver controlled without interfering the device migration flow (like rest of the state).
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">When migrate a device, it is the host who suspends the device. The reason is
the live migration process should be transparent to
the guest, so we should suspend the guest first, then suspend the device(by
host).
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
The practical reason for suspending functionality under guest control is, that resuming/suspending the large device can take time.
So let it be in guest driver control. No need to muddy with device migration flow.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">The time cost is reasonable in O(N) no matter how you suspend/resume the
device.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Very much depends. Big O notation can be misleading. If you have to
repeat an operation 1000 times that's 1000 * N and suddenly you are
going from milliseconds to seconds.</pre>
    </blockquote>
    <font face="monospace">I mean enable 100 queues cost more time then
      enable 1 vq no matter<br>
      how we enable it. that is O(N)<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">This should be a basic facility.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Other transport can also offer like PCI.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Do you want to work for these transport? Implementing the new features as
PCI?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Not presently as PCI as more features than rest of the two.
What I read about ccw is: " S/390 based virtual machines support neither PCI nor MMIO".

And I also read, "The IBM System/390 is a discontinued mainframe product family implementing".

So I don’t know who needs to extend ccw.
And if one needs, those maintainers will extend it to match to PCI standard.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">So these features are even not planned, so don't depend on them.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But again can one suspend ccw device? If you are adding this feature and
claiming it's supported for all transports you better find out
what does it do.</pre>
    </blockquote>
    <font face="monospace">I am not an expert on CCW, anything block we
      suspend a CCW device by this bit?<br>
      This seems only controlled by the device itself. <br>
    </font>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">In that case if there is suspend the device available, it will be
used by the
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">guest driver itself, hypervisor wouldn’t know about it when those
registers are not trapped.
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">So we need two ways to suspend.
One is guest visible, and guest controlled.
Second is hypervisor control to fulfill the device migration needs.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">The guest can eve reset the device.
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">So if you can please take a look if the proposed admin command to
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">freeze/stop mode can be used in the emulated register case or not.
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">It helps to have the suspend bit in guest control as well
with/without
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">emulation mode.
Parav, please believe I have read your series, I didn't comment there
because I want to avoid further conflicts/debating, we have done these
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">enough.
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I believe the series posted in v3 can support vdpa use case as well.
So I will progress to post v4.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">As explained before, freeze/stop the device by PCI is a layer violation.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I am afraid, we have different vision.
I don’t see any layer violation.
Suspend is enough in the PCI PM.
Our vision is more aligned with rest of the hypervisor knobs that owns the
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">migration framework.
I think I have explained, virito builds on other transport and it should be self-
contained, so far so good.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Virtio without any transport binding is just blank paper discussion.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">virtio is built on some transports, but not bind to any.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Binding is an OS specific thing, but e.g. under Linux transport drivers bind to
devices then virtio drivers bind to virtio bus. No binding -&gt; nothing
works.</pre>
    </blockquote>
    <font face="monospace">I think general facilities are better not
      only work on a specific transport</font><span
    style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">And device status can be pass-through(without emulation, just map it
to
guest) to the guest or trapped(trap and emulate by the hypervisor,
for example set_status in vDPA).
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">When it is pass-through, it is controlled by the guest, so for example, if the
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">guest resets the device, hypervisor has lost the control of migration context etc.
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hence, hypervisor needs a channel which is not guest owned.

Same channel can work when trap+emulation is done.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">It is the guest owns the device, it can reset the device, once reset, the device
context are cleared.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Hypervisor do not have the ability to read/write the device context. It lost the channel as hypervisor is not involved in trap+emulation.
So it is not helpful in one use case.

Admin commands can work even with trap+emulation mode.

What is missing, that should be added?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">as explained above, when live migration, the guest should be suspended
first, at this point,
the host owns the device, it has access to the device.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Where do you say this in the spec patch?</pre>
    </blockquote>
    <font face="monospace">VM live migration is not in this spec.<br>
      If we suspend the device first, then the guest may detect IO
      errors. </font><br>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">This can also be used for debugging I think.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">As Michael listed, a dedicated debug interface is usually more
useful instead
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">of in-band.
re-using another facility without extra efforts is not a bad thing anyway.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I just don’t see how a suspend bit some debug feature.
Almost everything with that regard is a debug feature to me.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">suspend then check the device states?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">You already suspended the device, so device state is already changed.
All debug information is changed, so not useful now.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">When suspended, the device should keep and stabilize its device states,
at least in my series it should behave like this.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's vague. What does it mean exactly and what happens if
some external event causes state change?</pre>
    </blockquote>
    <font face="monospace">it is suspended, somehow like powered-down,
      so it should not<br>
      respond to the events until resume.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231116070024-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
    <font face="monospace"><br>
    </font>
  </body>
</html>

--------------b0berctdbpCiiezwunzhbmSr--
