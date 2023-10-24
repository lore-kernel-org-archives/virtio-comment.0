Return-Path: <virtio-comment-return-7932-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E06CC00A8F
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:10:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 87D5E42D6A
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:10:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 696BB9869A8
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:10:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53F2B98699F; Tue, 24 Oct 2023 10:10:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 459F59869A0
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 10:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="390900621"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208,217";a="390900621"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="882076661"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208,217";a="882076661"
Content-Type: multipart/alternative;
 boundary="------------ZnBYA8bzjK4E0lp6gec24Icg"
Message-ID: <739fac26-15c8-4b5d-8206-656cbd423e7f@intel.com>
Date: Tue, 24 Oct 2023 18:10:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <PH0PR12MB54813F96D29B2D2ACEADD62ADCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b9ac0893-be30-41d9-8898-2a60e8e909aa@intel.com>
 <PH0PR12MB5481735CC313D32DBAA054E6DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2b7e3aac-e238-4056-bf8c-80640d631a1f@intel.com>
 <PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

--------------ZnBYA8bzjK4E0lp6gec24Icg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/23/2023 6:26 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan<lingshan.zhu@intel.com>
>> Sent: Monday, October 23, 2023 3:44 PM
>>
>> On 10/23/2023 6:01 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan<lingshan.zhu@intel.com>
>>>> Sent: Monday, October 23, 2023 3:18 PM
>>>>> No. Please read the response carefully.
>>>>> I said 'For non-backward compatible SIOV device of the future, yes,
>>>>> virtio-pci
>>>> common config (non init registers) should be moved to a vq, located
>>>> on the member device directly.'
>>>>> Notice the 'member device directly'.
>>>>> Not the PF admin vq.
>>>> I think this is a question to Michael and he answered.
>>>>
>>>> We are talking about PCI, not SIOV, for SIOV we need transport vq.
>>>>
>>> Hypervisor for future device and future functionality must not get involved in
>> looking the device configuration.
>>> Hence, as long as transport vq is located on the SIOV device itself for non-
>> backward items, it is fine to transport SIOV configuration.
>>> For backward compatibility purpose, one will be able to use the aq of the
>> owner device. No need to create a new transport VQ.
>>> To create a another transport vq, need to clarify the limitations of aq that
>> transport vq can overcome, and why aq cannot be extended to overcome it.
>> SIOV and transport vq is not related to this topic, don't mix them.
>>
>> and admin vq is not a must for live migration.
> Ok. You raised the point of transport vq...
>
> All repeat points, not leading anywhere for you nor me.
so, let's not take SIOV into consideration for this topic.
>   
>> and we are not introducing a new device type here.
>>
> It does not matter.
you citation is in that section.
>
>> For future device and future functionalities, let's discuss when they are
>> implementing, on their series.
> The new device will inherit the "basic functionality non init time register"...
> So please don’t propose to implement such.
so, still, I am not introducing a new type of device, right?
>
>>>> Here again, we are introducing basic facilities for live migration,
>>>> and the implementation is transport-specific.
>>> Not relevant comment.
>>>
>>>>>> Config space is control path, DMA is data-path, let's better not
>>>>>> mix them, we never expect to use config space to transfer data.
>>>>>>
>>>>> And that control path is only for the init time configuration as
>>>>> correctly listed in the virtio spec as,
>>>>>
>>>>> " Device configuration space should only be used for
>>>>> initialization-time
>>>> parameters.".
>>>> don't you know new field reset_vq is introduced to virtio common cfg?
>>>> This is not only for initialization, right?
>>> Right. It was unfortunate and also it was last moment entry that we had fixed
>> in reset register polarity.
>> Appendix B. Creating New Device Types, and we are not introducing new device
>> type.
> The concept still applies to existing device type.
> It is illogical otherwise.
In the title "new device"
>
>>>> and your citation is from Appendix B. Creating New Device Types, are
>>>> we creating a new device type?
>>> That is guidance for the new device creation on "how to use config space?"
>>> It equally applied to existing devices too to not grow.
>>> The section is equally helpful for new creators and for extending devices like
>> you and me to understand what not to put in config space.
>> this does not make any sense, if you stick to the wording, then let me repeat
>> again "Appendix B. Creating New Device Types"!!!!!!
> Sorry, your implying is: new device type should be efficient and existing one can make it further bad. Does not make sense to me.
>
> It is fully logical to have only init time things in the config registers as done today in the spec for existing and new devices.
>
> I would be happy to extend B.5 Device improvements to capture it too.
That section applies to new device with its title "Appendix B. Creating 
New Device Types"

And I agree we should modify this section, should remove this limitation.
>
>>>>>> So we need DMA to transfer data, for example I take advantages of
>>>>>> device DMA to logging dirty pages, This also applies to in-flight descriptors.
>>>>>>
>>>>> Can you please explain via virtqueue cannot be used for DMA bulk
>>>>> data
>>>> transfer as listed in virtio spec.
>>>>> " The mechanism for bulk data transport on virtio devices is
>>>>> pretentiously
>>>> called a virtqueue"
>>>> what is your point? vq can do DMA, so what?
>>> I am asking,
>>> If there is AQ on the member device, can you use it? If not, what is the
>> technical reason(s) to not use it.
>> Repeated for many times, QOS, nested and so on.
> Why would there be any QoS when the AQ is on the member device for non-passthrough use case?
> Why nested won't work when the AQ is on the member device for non-passthrough use case?
Have not we discussed these before?

--------------ZnBYA8bzjK4E0lp6gec24Icg
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
        6:26 PM, Parav Pandit wrote:<br>
      </font></div>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Zhu, Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Monday, October 23, 2023 3:44 PM

On 10/23/2023 6:01 PM, Parav Pandit wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: Zhu, Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Monday, October 23, 2023 3:18 PM
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">No. Please read the response carefully.
I said 'For non-backward compatible SIOV device of the future, yes,
virtio-pci
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">common config (non init registers) should be moved to a vq, located
on the member device directly.'
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Notice the 'member device directly'.
Not the PF admin vq.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I think this is a question to Michael and he answered.

We are talking about PCI, not SIOV, for SIOV we need transport vq.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Hypervisor for future device and future functionality must not get involved in
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">looking the device configuration.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hence, as long as transport vq is located on the SIOV device itself for non-
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">backward items, it is fine to transport SIOV configuration.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">For backward compatibility purpose, one will be able to use the aq of the
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">owner device. No need to create a new transport VQ.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">To create a another transport vq, need to clarify the limitations of aq that
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">transport vq can overcome, and why aq cannot be extended to overcome it.
SIOV and transport vq is not related to this topic, don't mix them.

and admin vq is not a must for live migration.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ok. You raised the point of transport vq...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">All repeat points, not leading anywhere for you nor me.</pre>
    </blockquote>
    <font face="monospace">so, let's not take SIOV into consideration
      for this topic.</font><br>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
 
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">and we are not introducing a new device type here.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">It does not matter.</pre>
    </blockquote>
    <font face="monospace">you citation is in that section. </font><br>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">For future device and future functionalities, let's discuss when they are
implementing, on their series.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">The new device will inherit the "basic functionality non init time register"...
So please don’t propose to implement such.</pre>
    </blockquote>
    <font face="monospace">so, still, I am not introducing a new type of
      device, right?</font><br>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Here again, we are introducing basic facilities for live migration,
and the implementation is transport-specific.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Not relevant comment.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Config space is control path, DMA is data-path, let's better not
mix them, we never expect to use config space to transfer data.

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">And that control path is only for the init time configuration as
correctly listed in the virtio spec as,

" Device configuration space should only be used for
initialization-time
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">parameters.".
don't you know new field reset_vq is introduced to virtio common cfg?
This is not only for initialization, right?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Right. It was unfortunate and also it was last moment entry that we had fixed
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">in reset register polarity.
Appendix B. Creating New Device Types, and we are not introducing new device
type.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">The concept still applies to existing device type.
It is illogical otherwise.</pre>
    </blockquote>
    <font face="monospace">In the title "new device"</font><br>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">and your citation is from Appendix B. Creating New Device Types, are
we creating a new device type?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">That is guidance for the new device creation on "how to use config space?"
It equally applied to existing devices too to not grow.
The section is equally helpful for new creators and for extending devices like
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">you and me to understand what not to put in config space.
this does not make any sense, if you stick to the wording, then let me repeat
again "Appendix B. Creating New Device Types"!!!!!!
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Sorry, your implying is: new device type should be efficient and existing one can make it further bad. Does not make sense to me.

It is fully logical to have only init time things in the config registers as done today in the spec for existing and new devices.

I would be happy to extend B.5 Device improvements to capture it too.</pre>
    </blockquote>
    <font face="monospace">That section applies to new device with its
      title "<span style="white-space: pre-wrap">Appendix B. Creating New Device Types</span>"<br>
      <br>
      And I agree we should modify this section, should remove this
      limitation.<br>
    </font>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">So we need DMA to transfer data, for example I take advantages of
device DMA to logging dirty pages, This also applies to in-flight descriptors.

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Can you please explain via virtqueue cannot be used for DMA bulk
data
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">transfer as listed in virtio spec.
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">" The mechanism for bulk data transport on virtio devices is
pretentiously
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">called a virtqueue"
what is your point? vq can do DMA, so what?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I am asking,
If there is AQ on the member device, can you use it? If not, what is the
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">technical reason(s) to not use it.
Repeated for many times, QOS, nested and so on.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Why would there be any QoS when the AQ is on the member device for non-passthrough use case?
Why nested won't work when the AQ is on the member device for non-passthrough use case?</pre>
    </blockquote>
    <font face="monospace">Have not we discussed these before?</font><br>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <font face="monospace"><br>
    </font>
  </body>
</html>

--------------ZnBYA8bzjK4E0lp6gec24Icg--
