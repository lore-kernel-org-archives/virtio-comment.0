Return-Path: <virtio-comment-return-8228-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33269C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:09:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 76DF12B07D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:09:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A110986A81
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:09:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0210F9867F0; Tue,  7 Nov 2023 09:09:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5EE29867F1
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 09:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="369660847"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208,217";a="369660847"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="879736354"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208,217";a="879736354"
Content-Type: multipart/alternative;
 boundary="------------Bah36vnlRyhULuI0LpI06QE3"
Message-ID: <bfa59a74-76b9-48d1-84e1-90e42a3e5bdf@intel.com>
Date: Tue, 7 Nov 2023 17:09:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <20231106043648-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231106043648-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH V2 2/6] virtio: introduce SUSPEND bit
 in device status

--------------Bah36vnlRyhULuI0LpI06QE3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/6/2023 5:43 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 03, 2023 at 06:34:33PM +0800, Zhu Lingshan wrote:
>> This patch introduces a new status bit in the device status: SUSPEND.
>>
>> This SUSPEND bit can be used by the driver to suspend a device,
>> in order to stabilize the device states and virtqueue states.
>>
>> Its main use case is live migration.
>>
>> Signed-off-by: Zhu Lingshan<lingshan.zhu@intel.com>
>> Signed-off-by: Jason Wang<jasowang@redhat.com>
>> Signed-off-by: Eugenio Pérez<eperezma@redhat.com>
>> ---
>>   content.tex | 36 ++++++++++++++++++++++++++++++++++--
>>   1 file changed, 34 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 76813b5..bcc9d4b 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -49,6 +49,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>   
>>   \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>     an error from which it can't recover.
>> +
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
>> +  device has been suspended by the driver.
>> +
> what does this mean?
When the driver sets SUSPEND and the device presents SUSPEND, means
the device has been suspended by the driver.

Do you suggest to remove "When VIRTIO_F_SUSPEND is negotiated"
>
>>   \end{description}
>>   
>>   The \field{device status} field starts out as 0, and is reinitialized to 0 by
>> @@ -73,6 +77,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>   recover by issuing a reset.
>>   \end{note}
>>   
>> +The driver SHOULD NOT set SUSPEND if FEATURES_OK is not set.
>> +
>> +When setting SUSPEND, the driver MUST re-read \field{device status} to ensure the SUSPEND bit is set.
>> +
> and if it's not?
Then the device may run into errors or just need longer time to suspend.

This is how we handle features_OK: "Re-read device status to ensure the 
FEATURES_OK bit is still set"
>
>>   \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
>>   
>>   The device MUST NOT consume buffers or send any used buffer
>> @@ -82,6 +90,26 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>   that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
>>   MUST send a device configuration change notification to the driver.
>>   
>> +The device MUST ignore SUSPEND if FEATURES_OK is not set.
>> +
>> +The device MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +The device SHOULD allow settings to \field{device status} even when SUSPEND is set.
> which settings?
any legit writing to the device status, like DRIVER_OK
>
>> +
>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device SHOULD clear SUSPEND
>> +and resumes operation upon DRIVER_OK.
>> +
>> +If VIRTIO_F_SUSPEND is negotiated, when the driver sets SUSPEND,
>> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop consuming buffers of any virtqueues and mark all finished descritors as used.
> descritors? and what does finished mean?
Sorry my typo.

Finished means done processing it.

Like the spec words: When the device has finished a buffer, it writes 
the descriptor index into the used ring, and sends a used buffer 
notification.
>
>> +\item Wait until all descriptors that being processed to finish and mark them as used.
> descriptors are not marked used. buffers are.
>
> that being -> that are being maybe?
Will fix
>
>> +\item Flush all used buffer and send used buffer notifications to the driver.
> used buffers?
Here it means the buffer marked as used.
shall I use finished buffer or any other suggestions?
> what does Flush mean?
Flush means send all of them out. Like 5.19.7.1 Device Requirements: 
Device Operation: Virtqueue flush

>
>> +\item Record Virtqueue State of each enabled virtqueue, see section \ref{sec:Virtqueues / Virtqueue State}
> execpt that one unfortunately does not bother to say what does this mean
> :(
The virtqueue state has been defined in this series, in 
packed/split-ring.tex.
And an PCI implementation of the interfaces is included.

Do you suggest any supplementary materials?
>
>> +\item Pause its operation except \field{device status} and preserve configurations in its Device Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
> How do you Pause? For example, consider a link state register. You set
The device pauses itself.
> SUSPEND, then link goes down. What is device supposed to do?
Once the device suspended, the device should not respond to the link_down
until alive again. This is to preserve the device states, just record
whatever it is when SUSPEND-ed. And process the signal when resume or
alive at the destination side. At the destination it also needs a
live announce which require an active link.
> Record this somewhere internal but do not show it to driver?
> And how exactly will this hidden internal state be migrated
> since it is not visible?
May I know what kind of internal states?
This series migrates stateless devices, hard to define virtio-fs device 
context.
>
>
>> +\end{itemize}
>> +
>>   \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}
>>   
>>   Each virtio device offers all the features it understands.  During
>> @@ -99,10 +127,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>   \begin{description}
>>   \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>   
>> -\item[24 to 42] Feature bits reserved for extensions to the queue and
>> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>>     feature negotiation mechanisms
>>   
>> -\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>> +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
>>   \end{description}
>>   
>>   \begin{note}
>> @@ -875,6 +903,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>     \item[VIRTIO_F_QUEUE_STATE(42)] This feature indicates that the device allows the driver
>>     to access its internal virtqueue state.
>>   
>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>> +   SUSPEND the device.
> why is SUSPEND upper-case here?
will be lower in V3.

Thanks
>
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>   \end{description}
>>   
>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> -- 
>> 2.35.3
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe:virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe:virtio-comment-unsubscribe@lists.oasis-open.org
> List help:virtio-comment-help@lists.oasis-open.org
> List archive:https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License:https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee:https://www.oasis-open.org/committees/virtio/
> Join OASIS:https://www.oasis-open.org/join/
>

--------------Bah36vnlRyhULuI0LpI06QE3
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
    <div class="moz-cite-prefix"><font face="monospace">On 11/6/2023
        5:43 PM, Michael S. Tsirkin wrote:<br>
      </font></div>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Fri, Nov 03, 2023 at 06:34:33PM +0800, Zhu Lingshan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch introduces a new status bit in the device status: SUSPEND.

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
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
what does this mean?</pre>
    </blockquote>
    <font face="monospace">When the driver sets SUSPEND and the device
      presents SUSPEND, means<br>
      the device has been suspended by the driver.<br>
      <br>
      Do you suggest to remove "<span style="white-space: pre-wrap">When VIRTIO_F_SUSPEND is negotiated<font
      style="white-space: normal;">"</font></span></font>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> \end{description}
 
 The \field{device status} field starts out as 0, and is reinitialized to 0 by
@@ -73,6 +77,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 recover by issuing a reset.
 \end{note}
 
+The driver SHOULD NOT set SUSPEND if FEATURES_OK is not set.
+
+When setting SUSPEND, the driver MUST re-read \field{device status} to ensure the SUSPEND bit is set.
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
and if it's not?</pre>
    </blockquote>
    <font face="monospace">Then the device may run into errors or just
      need longer time to suspend.<br>
      <br>
      This is how we handle features_OK: "Re-read device status to
      ensure the FEATURES_OK bit is still set"<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
 
 The device MUST NOT consume buffers or send any used buffer
@@ -82,6 +90,26 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
 MUST send a device configuration change notification to the driver.
 
+The device MUST ignore SUSPEND if FEATURES_OK is not set.
+
+The device MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
+
+The device SHOULD allow settings to \field{device status} even when SUSPEND is set.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
which settings?</pre>
    </blockquote>
    <font face="monospace">any legit writing to the device status, like
      DRIVER_OK</font><br>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device SHOULD clear SUSPEND
+and resumes operation upon DRIVER_OK.
+
+If VIRTIO_F_SUSPEND is negotiated, when the driver sets SUSPEND,
+the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
+
+\begin{itemize}
+\item Stop consuming buffers of any virtqueues and mark all finished descritors as used.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
descritors? and what does finished mean?</pre>
    </blockquote>
    <font face="monospace">Sorry my typo.<br>
      <br>
      Finished means done processing it.<br>
      <br>
      Like the spec words: When the device has finished a buffer, it
      writes the descriptor index into the used ring, and sends a used
      buffer notification.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+\item Wait until all descriptors that being processed to finish and mark them as used.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
descriptors are not marked used. buffers are.

that being -&gt; that are being maybe?</pre>
    </blockquote>
    <font face="monospace">Will fix</font><br>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+\item Flush all used buffer and send used buffer notifications to the driver.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
used buffers?</pre>
    </blockquote>
    <font face="monospace">Here it means the buffer marked as used.<br>
      shall I use finished buffer or any other suggestions?</font><br>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">
what does Flush mean?</pre>
    </blockquote>
    <font face="monospace">Flush means send all of them out. Like
      5.19.7.1 Device Requirements: Device Operation: Virtqueue flush<br>
    </font><br>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+\item Record Virtqueue State of each enabled virtqueue, see section \ref{sec:Virtqueues / Virtqueue State}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
execpt that one unfortunately does not bother to say what does this mean
:(</pre>
    </blockquote>
    <font face="monospace">The virtqueue state has been defined in this
      series, in packed/split-ring.tex.<br>
      And an PCI implementation of the interfaces is included.<br>
      <br>
      Do you suggest any supplementary materials?<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+\item Pause its operation except \field{device status} and preserve configurations in its Device Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How do you Pause? For example, consider a link state register. You set</pre>
    </blockquote>
    <font face="monospace">The device pauses itself.</font><br>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">
SUSPEND, then link goes down. What is device supposed to do?</pre>
    </blockquote>
    <font face="monospace">Once the device suspended, the device should
      not respond to the link_down<br>
      until alive again. This is to preserve the device states, just
      record<br>
      whatever it is when SUSPEND-ed. And process the signal when resume
      or<br>
      alive at the destination side. At the destination it also needs a<br>
      live announce which require an active link. <br>
    </font>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">
Record this somewhere internal but do not show it to driver?
And how exactly will this hidden internal state be migrated
since it is not visible?</pre>
    </blockquote>
    <font face="monospace">May I know what kind of internal states?<br>
      This series migrates stateless devices, hard to define virtio-fs
      device context.<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+\end{itemize}
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
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
why is SUSPEND upper-case here?</pre>
    </blockquote>
    <font face="monospace">will be lower in V3.<br>
      <br>
      Thanks<br>
    </font>
    <blockquote type="cite"
      cite="mid:20231106043648-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
-- 
2.35.3
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

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
    <font face="monospace"><br>
    </font>
  </body>
</html>

--------------Bah36vnlRyhULuI0LpI06QE3--
