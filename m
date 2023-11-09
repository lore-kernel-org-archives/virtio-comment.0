Return-Path: <virtio-comment-return-8291-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B814AC4167D
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:55:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1BA6B2CAD9
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:55:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA969986CD1
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:55:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C7D26986CCD; Thu,  9 Nov 2023 09:55:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8922986CCE
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 09:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="8601899"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208,217";a="8601899"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936801440"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208,217";a="936801440"
Content-Type: multipart/alternative;
 boundary="------------zirFchmTt2h8eFzDUX05DMpe"
Message-ID: <bb11c745-4532-4695-96e1-f8ca6f385731@intel.com>
Date: Thu, 9 Nov 2023 17:55:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <20231106043648-mutt-send-email-mst@kernel.org>
 <bfa59a74-76b9-48d1-84e1-90e42a3e5bdf@intel.com>
 <20231108124844-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231108124844-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH V2 2/6] virtio: introduce SUSPEND bit
 in device status

--------------zirFchmTt2h8eFzDUX05DMpe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/9/2023 1:55 AM, Michael S. Tsirkin wrote:
> On Tue, Nov 07, 2023 at 05:09:06PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/6/2023 5:43 PM, Michael S. Tsirkin wrote:
>>
>>      On Fri, Nov 03, 2023 at 06:34:33PM +0800, Zhu Lingshan wrote:
>>
>>          This patch introduces a new status bit in the device status: SUSPEND.
>>
>>          This SUSPEND bit can be used by the driver to suspend a device,
>>          in order to stabilize the device states and virtqueue states.
>>
>>          Its main use case is live migration.
>>
>>          Signed-off-by: Zhu Lingshan<lingshan.zhu@intel.com>
>>          Signed-off-by: Jason Wang<jasowang@redhat.com>
>>          Signed-off-by: Eugenio Pérez<eperezma@redhat.com>
>>          ---
>>           content.tex | 36 ++++++++++++++++++++++++++++++++++--
>>           1 file changed, 34 insertions(+), 2 deletions(-)
>>
>>          diff --git a/content.tex b/content.tex
>>          index 76813b5..bcc9d4b 100644
>>          --- a/content.tex
>>          +++ b/content.tex
>>          @@ -49,6 +49,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>
>>           \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>             an error from which it can't recover.
>>          +
>>          +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
>>          +  device has been suspended by the driver.
>>          +
>>
>>      what does this mean?
>>
>> When the driver sets SUSPEND and the device presents SUSPEND, means
>> the device has been suspended by the driver.
>>
>> Do you suggest to remove "When VIRTIO_F_SUSPEND is negotiated"
>>
>
> No I suggest explaining what does it mean that device has been
> suspended.
I will add "to stabilize the device states", is that OK?
>
>>           \end{description}
>>
>>           The \field{device status} field starts out as 0, and is reinitialized to 0 by
>>          @@ -73,6 +77,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>           recover by issuing a reset.
>>           \end{note}
>>
>>          +The driver SHOULD NOT set SUSPEND if FEATURES_OK is not set.
>>          +
>>          +When setting SUSPEND, the driver MUST re-read \field{device status} to ensure the SUSPEND bit is set.
>>          +
>>
>>      and if it's not?
>>
>> Then the device may run into errors or just need longer time to suspend.
> and then what does driver do?
I assume the driver should reset the device or give up the device.

Re-read is how we handle other status, like features_ok.
>
>> This is how we handle features_OK: "Re-read device status to ensure the
>> FEATURES_OK bit is still set"
> this is designed in case features are inconsistent.
I think this is designed to: 1) flush the device status 2) make sure the 
features are set.
> what kind of thing are you handling here?
The same purpose, to flush the status and make sure suspend is set.
Once we make sure the device has been suspended, we can fetch
the device states.
> Also and then we bail out and retry with other feature set if not.
> what do we do here?
same as above, if the device is not suspended, like vqs still running,
we can not fetch stable vq states. So we need to make sure it is
set.
>
>>
>>           \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
>>
>>           The device MUST NOT consume buffers or send any used buffer
>>          @@ -82,6 +90,26 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>           that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
>>           MUST send a device configuration change notification to the driver.
>>
>>          +The device MUST ignore SUSPEND if FEATURES_OK is not set.
>>          +
>>          +The device MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
>>          +
>>          +The device SHOULD allow settings to \field{device status} even when SUSPEND is set.
>>
>>      which settings?
>>
>> any legit writing to the device status, like DRIVER_OK
>>
> that's not "settings" that's setting.
>
>>          +
>>          +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device SHOULD clear SUSPEND
>>          +and resumes operation upon DRIVER_OK.
>>          +
>>          +If VIRTIO_F_SUSPEND is negotiated, when the driver sets SUSPEND,
>>          +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
>>          +
>>          +\begin{itemize}
>>          +\item Stop consuming buffers of any virtqueues and mark all finished descritors as used.
>>
>>      descritors? and what does finished mean?
>>
>> Sorry my typo.
>>
>> Finished means done processing it.
>>
>> Like the spec words: When the device has finished a buffer, it writes the
>> descriptor index into the used ring, and sends a used buffer notification.
>>
> only good for internal ring documentation - we did not want to say
> used because it's not used until used entry written.
> here just say used.
I am confused, by "here just say used", do you suggest we say:
"Stop consuming buffers of any virtqueues and mark all used descriptors 
as used."?

I am not a native speaker, and I am not sure this is better than finished
>
>>
>>          +\item Wait until all descriptors that being processed to finish and mark them as used.
>>
>>      descriptors are not marked used. buffers are.
>>
>>      that being -> that are being maybe?
>>
>> Will fix
>>
>>
>>
>>          +\item Flush all used buffer and send used buffer notifications to the driver.
>>
>>      used buffers?
>>
>> Here it means the buffer marked as used.
>> shall I use finished buffer or any other suggestions?
>>
>>      what does Flush mean?
>>
>> Flush means send all of them out. Like 5.19.7.1 Device Requirements: Device
>> Operation: Virtqueue flush
>>
>>
>>
>>
>>          +\item Record Virtqueue State of each enabled virtqueue, see section \ref{sec:Virtqueues / Virtqueue State}
>>
>>      execpt that one unfortunately does not bother to say what does this mean
>>      :(
>>
>> The virtqueue state has been defined in this series, in packed/split-ring.tex.
>> And an PCI implementation of the interfaces is included.
>>
>> Do you suggest any supplementary materials?
>>
> I suggest something that documents what it means unlike what is
> in this series.
How about: "Record Virtqueue State of each enabled virtqueue by the 
transport specific interfaces"?
>
>
>>          +\item Pause its operation except \field{device status} and preserve configurations in its Device Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
>>
>>      How do you Pause? For example, consider a link state register. You set
>>
>> The device pauses itself.
>>
>>      SUSPEND, then link goes down. What is device supposed to do?
>>
>> Once the device suspended, the device should not respond to the link_down
>> until alive again.
> what is link_down?
> link goes down just by virtue of disconnecting it physically.
To stabilize the device states, once suspended, even link down,
the device should not respond to it, this means:
1) if link down happens before suspend, the device detect and send an 
config interrupt.
2) if link down happens after suspend, the device should not respond to it.
3) if the device resume running, then detect link down and send an 
config interrupt.
>
>> This is to preserve the device states, just record
>> whatever it is when SUSPEND-ed. And process the signal when resume or
>> alive at the destination side. At the destination it also needs a
>> live announce which require an active link.
>>
>>      Record this somewhere internal but do not show it to driver?
>>      And how exactly will this hidden internal state be migrated
>>      since it is not visible?
>>
>> May I know what kind of internal states?
>> This series migrates stateless devices, hard to define virtio-fs device
>> context.
>>
> all devices have some state, none are completely stateless.
Some of the states can be read from config space, hypervisor can migrate 
them for sure.
Others like virtio-fs are hard to define for now, but we still need to 
make progress in live migration.
>
>
>>
>>          +\end{itemize}
>>          +
>>           \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}
>>
>>           Each virtio device offers all the features it understands.  During
>>          @@ -99,10 +127,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>           \begin{description}
>>           \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>
>>          -\item[24 to 42] Feature bits reserved for extensions to the queue and
>>          +\item[24 to 43] Feature bits reserved for extensions to the queue and
>>             feature negotiation mechanisms
>>
>>          -\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>>          +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
>>           \end{description}
>>
>>           \begin{note}
>>          @@ -875,6 +903,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>             \item[VIRTIO_F_QUEUE_STATE(42)] This feature indicates that the device allows the driver
>>             to access its internal virtqueue state.
>>
>>          +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>>          +   SUSPEND the device.
>>
>>      why is SUSPEND upper-case here?
>>
>> will be lower in V3.
>>
>> Thanks
>>
>>
>>
>>          +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>          +
>>           \end{description}
>>
>>           \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>>          --
>>          2.35.3
>>
>>
>>      This publicly archived list offers a means to provide input to the
>>      OASIS Virtual I/O Device (VIRTIO) TC.
>>
>>      In order to verify user consent to the Feedback License terms and
>>      to minimize spam in the list archive, subscription is required
>>      before posting.
>>
>>      Subscribe:virtio-comment-subscribe@lists.oasis-open.org
>>      Unsubscribe:virtio-comment-unsubscribe@lists.oasis-open.org
>>      List help:virtio-comment-help@lists.oasis-open.org
>>      List archive:https://lists.oasis-open.org/archives/virtio-comment/
>>      Feedback License:https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>      List Guidelines:https://www.oasis-open.org/policies-guidelines/mailing-lists
>>      Committee:https://www.oasis-open.org/committees/virtio/
>>      Join OASIS:https://www.oasis-open.org/join/
>>
>>
>>

--------------zirFchmTt2h8eFzDUX05DMpe
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
    <div class="moz-cite-prefix"><font face="monospace">On 11/9/2023
        1:55 AM, Michael S. Tsirkin wrote:<br>
      </font></div>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Tue, Nov 07, 2023 at 05:09:06PM +0800, Zhu, Lingshan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 11/6/2023 5:43 PM, Michael S. Tsirkin wrote:

    On Fri, Nov 03, 2023 at 06:34:33PM +0800, Zhu Lingshan wrote:

        This patch introduces a new status bit in the device status: SUSPEND.

        This SUSPEND bit can be used by the driver to suspend a device,
        in order to stabilize the device states and virtqueue states.

        Its main use case is live migration.

        Signed-off-by: Zhu Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
        Signed-off-by: Jason Wang <a class="moz-txt-link-rfc2396E" href="mailto:jasowang@redhat.com">&lt;jasowang@redhat.com&gt;</a>
        Signed-off-by: Eugenio Pérez <a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>
        ---
         content.tex | 36 ++++++++++++++++++++++++++++++++++--
         1 file changed, 34 insertions(+), 2 deletions(-)

        diff --git a/content.tex b/content.tex
        index 76813b5..bcc9d4b 100644
        --- a/content.tex
        +++ b/content.tex
        @@ -49,6 +49,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev

         \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
           an error from which it can't recover.
        +
        +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
        +  device has been suspended by the driver.
        +

    what does this mean?

When the driver sets SUSPEND and the device presents SUSPEND, means
the device has been suspended by the driver.

Do you suggest to remove "When VIRTIO_F_SUSPEND is negotiated"

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

No I suggest explaining what does it mean that device has been
suspended.</pre>
    </blockquote>
    <font face="monospace">I will add "to stabilize the device states",
      is that OK?<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
         \end{description}

         The \field{device status} field starts out as 0, and is reinitialized to 0 by
        @@ -73,6 +77,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
         recover by issuing a reset.
         \end{note}

        +The driver SHOULD NOT set SUSPEND if FEATURES_OK is not set.
        +
        +When setting SUSPEND, the driver MUST re-read \field{device status} to ensure the SUSPEND bit is set.
        +

    and if it's not?

Then the device may run into errors or just need longer time to suspend.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
and then what does driver do?</pre>
    </blockquote>
    <font face="monospace">I assume the driver should reset the device
      or give up the device.<br>
      <br>
      Re-read is how we handle other status, like features_ok.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This is how we handle features_OK: "Re-read device status to ensure the
FEATURES_OK bit is still set"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
this is designed in case features are inconsistent.</pre>
    </blockquote>
    <font face="monospace">I think this is designed to: 1) flush the
      device status 2) make sure the features are set.</font><br>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">
what kind of thing are you handling here?</pre>
    </blockquote>
    <font face="monospace">The same purpose, to flush the status and
      make sure suspend is set.<br>
      Once we make sure the device has been suspended, we can fetch<br>
      the device states.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">
Also and then we bail out and retry with other feature set if not.
what do we do here?</pre>
    </blockquote>
    <font face="monospace">same as above, if the device is not
      suspended, like vqs still running,<br>
      we can not fetch stable vq states. So we need to make sure it is<br>
      set.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

         \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}

         The device MUST NOT consume buffers or send any used buffer
        @@ -82,6 +90,26 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
         that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
         MUST send a device configuration change notification to the driver.

        +The device MUST ignore SUSPEND if FEATURES_OK is not set.
        +
        +The device MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
        +
        +The device SHOULD allow settings to \field{device status} even when SUSPEND is set.

    which settings?

any legit writing to the device status, like DRIVER_OK

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
that's not "settings" that's setting.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
        +
        +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device SHOULD clear SUSPEND
        +and resumes operation upon DRIVER_OK.
        +
        +If VIRTIO_F_SUSPEND is negotiated, when the driver sets SUSPEND,
        +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
        +
        +\begin{itemize}
        +\item Stop consuming buffers of any virtqueues and mark all finished descritors as used.

    descritors? and what does finished mean?

Sorry my typo.

Finished means done processing it.

Like the spec words: When the device has finished a buffer, it writes the
descriptor index into the used ring, and sends a used buffer notification.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
only good for internal ring documentation - we did not want to say
used because it's not used until used entry written.
here just say used.</pre>
    </blockquote>
    <font face="monospace">I am confused, by "here just say used", do
      you suggest we say:<br>
      "Stop consuming buffers of any virtqueues and mark all used
      descriptors as used."?<br>
      <br>
      I am not a native speaker, and I am not sure this is better than
      finished<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

        +\item Wait until all descriptors that being processed to finish and mark them as used.

    descriptors are not marked used. buffers are.

    that being -&gt; that are being maybe?

Will fix



        +\item Flush all used buffer and send used buffer notifications to the driver.

    used buffers?

Here it means the buffer marked as used.
shall I use finished buffer or any other suggestions?

    what does Flush mean?

Flush means send all of them out. Like 5.19.7.1 Device Requirements: Device
Operation: Virtqueue flush




        +\item Record Virtqueue State of each enabled virtqueue, see section \ref{sec:Virtqueues / Virtqueue State}

    execpt that one unfortunately does not bother to say what does this mean
    :(

The virtqueue state has been defined in this series, in packed/split-ring.tex.
And an PCI implementation of the interfaces is included.

Do you suggest any supplementary materials?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I suggest something that documents what it means unlike what is
in this series.</pre>
    </blockquote>
    <font face="monospace">How about: "<span
      style="white-space: pre-wrap">Record Virtqueue State of each enabled virtqueue</span>
      by the transport specific interfaces"?</font><br>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
        +\item Pause its operation except \field{device status} and preserve configurations in its Device Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}

    How do you Pause? For example, consider a link state register. You set

The device pauses itself.

    SUSPEND, then link goes down. What is device supposed to do?

Once the device suspended, the device should not respond to the link_down
until alive again.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
what is link_down?
link goes down just by virtue of disconnecting it physically.</pre>
    </blockquote>
    <font face="monospace">To stabilize the device states, once
      suspended, even link down,<br>
      the device should not respond to it, this means:<br>
      1) if link down happens before suspend, the device detect and send
      an config interrupt.<br>
      2) if link down happens after suspend, the device should not
      respond to it.<br>
      3) if the device resume running, then detect link down and send an
      config interrupt.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This is to preserve the device states, just record
whatever it is when SUSPEND-ed. And process the signal when resume or
alive at the destination side. At the destination it also needs a
live announce which require an active link.

    Record this somewhere internal but do not show it to driver?
    And how exactly will this hidden internal state be migrated
    since it is not visible?

May I know what kind of internal states?
This series migrates stateless devices, hard to define virtio-fs device
context.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
all devices have some state, none are completely stateless.</pre>
    </blockquote>
    <font face="monospace">Some of the states can be read from config
      space, hypervisor can migrate them for sure.<br>
      Others like virtio-fs are hard to define for now, but we still
      need to make progress in live migration.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231108124844-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

        +\end{itemize}
        +
         \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}

         Each virtio device offers all the features it understands.  During
        @@ -99,10 +127,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
         \begin{description}
         \item[0 to 23, and 50 to 127] Feature bits for the specific device type

        -\item[24 to 42] Feature bits reserved for extensions to the queue and
        +\item[24 to 43] Feature bits reserved for extensions to the queue and
           feature negotiation mechanisms

        -\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
        +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
         \end{description}

         \begin{note}
        @@ -875,6 +903,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
           \item[VIRTIO_F_QUEUE_STATE(42)] This feature indicates that the device allows the driver
           to access its internal virtqueue state.

        +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
        +   SUSPEND the device.

    why is SUSPEND upper-case here?

will be lower in V3.

Thanks



        +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
        +
         \end{description}

         \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
        --
        2.35.3


    This publicly archived list offers a means to provide input to the
    OASIS Virtual I/O Device (VIRTIO) TC.

    In order to verify user consent to the Feedback License terms and
    to minimize spam in the list archive, subscription is required
    before posting.

    Subscribe: <a class="moz-txt-link-abbreviated" href="mailto:virtio-comment-subscribe@lists.oasis-open.org">virtio-comment-subscribe@lists.oasis-open.org</a>
    Unsubscribe: <a class="moz-txt-link-abbreviated" href="mailto:virtio-comment-unsubscribe@lists.oasis-open.org">virtio-comment-unsubscribe@lists.oasis-open.org</a>
    List help: <a class="moz-txt-link-abbreviated" href="mailto:virtio-comment-help@lists.oasis-open.org">virtio-comment-help@lists.oasis-open.org</a>
    List archive: <a class="moz-txt-link-freetext" href="https://lists.oasis-open.org/archives/virtio-comment/">https://lists.oasis-open.org/archives/virtio-comment/</a>
    Feedback License: <a class="moz-txt-link-freetext" href="https://www.oasis-open.org/who/ipr/feedback_license.pdf">https://www.oasis-open.org/who/ipr/feedback_license.pdf</a>
    List Guidelines: <a class="moz-txt-link-freetext" href="https://www.oasis-open.org/policies-guidelines/mailing-lists">https://www.oasis-open.org/policies-guidelines/mailing-lists</a>
    Committee: <a class="moz-txt-link-freetext" href="https://www.oasis-open.org/committees/virtio/">https://www.oasis-open.org/committees/virtio/</a>
    Join OASIS: <a class="moz-txt-link-freetext" href="https://www.oasis-open.org/join/">https://www.oasis-open.org/join/</a>



</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <font face="monospace"><br>
    </font>
  </body>
</html>

--------------zirFchmTt2h8eFzDUX05DMpe--
