Return-Path: <virtio-comment-return-7572-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2861BE728D6
	for <virtio-comment@archiver.kernel.org>; Fri, 29 Sep 2023 18:39:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C6B929FD4
	for <virtio-comment@archiver.kernel.org>; Fri, 29 Sep 2023 18:39:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42552986718
	for <virtio-comment@archiver.kernel.org>; Fri, 29 Sep 2023 18:39:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2C92F986708; Fri, 29 Sep 2023 18:39:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B3A4986709
	for <virtio-comment@lists.oasis-open.org>; Fri, 29 Sep 2023 18:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1696012737.120000
X-TM-MAIL-UUID: e4250daf-978c-4ff7-860c-0b7c3e3b9ea7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5hDusN16X+s4YVcXiW+PYfSj/tAuluwAHygGiEXqa3HQ8pJNWq3QX4VTOkkF2rJ/y5vKd6JVYoXETiW3VLj8zoEthGh97nunlQGKtPbT8ZhjcrFfEaEwRMLQVM5gG3HB/bN5Da9lm2I7w4YtwDOxVncZoFWKICWSHHKVbMIKK80GaqF+GRbWBRJblRJ7bEOCP//cxD0tFHBXhFdAv3Vxw0wCLgqvqzg6g/teQu21F1i/xL1svoNAPDvsraBTgllvBmSgN1wh60O5FLmMYd2CIw6cIMLLHbllfuclVAynr4UcIS7I3mAvvopLom+W8LIrJuFR3hUx4j3rvUxzwx/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdICJ7QYYl09Wyq1XyrCsHUtZVT/xBYQvnH8R9ic9D8=;
 b=WGE9RFfDXfImQaTAKdJlz/0uW3sExwiukN+G7lK1NCXni8iJTaUejXUnR2MaZo2ahPib99rASX1mpjvkxNpJFHpgagzQET98xTha9NhVBZgBwj05RO6cSsvikiDYoo7vGXw8JVvODNjiQb4j5gU6CAdQKEK6RoBFnNQAonnHIC7jfvLzAzTJnTK/7FtXfB9eMk1JNTQZR1OizApkjwF6y7zMOCevdYhTSVPrtpLEqjU67jz+QwhX69A7q5D3yUF7x/a7mZFbf3rbZohrZsB9t+tx60dxjTrP3MsWiukBMlv3x/OseicC7EXYzAAYgK6ext96HpHhgqOXw9p7IiNhUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <9da5f426-0099-8b58-bb24-fdbfeb02b4fc@opensynergy.com>
Date: Fri, 29 Sep 2023 20:38:54 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb5b1603-68eb-3301-9e5c-6bb81e9bc594@opensynergy.com>
 <PH0PR12MB5481CA116DBB424005B0B5D1DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <766e94a2-2592-d3ca-2ddf-164022df05da@opensynergy.com>
 <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com>
 <PH0PR12MB5481BA022FC2CA834264CC47DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <PH0PR12MB5481BA022FC2CA834264CC47DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0283.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::9) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BE1P281MB2225:EE_
X-MS-Office365-Filtering-Correlation-Id: 7202ab75-01ff-4fa0-f226-08dbc11b55df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y5WzRZ0i+WAW8KqnhKfKPNj89faSk04oS4k5t+IFRzURnZalbKG+Wu1T1G51/zCW/pWTaPUuEmylcn6uU6Kot4KIdIE2/YVTCh/Nz2M+71HrnmvJzXZLQRl1YdOr3m0UhF8o0YZN2eTYXgZsxJSQZtkldVjHpHNy8UGfTdhZD5UO1vKc2UPxtDJTSAiAt0ghfIJpu5Vt/uI3JssSFrYVF2Vsm6JlUNg5Gu2dS/PYf9YLSSgY06oDmiiP/F595XgzhJv9klussQTxd47oRX4YG5Jb6ZwkMofbE8UCPygjYMT4LYgGtMVBpuwdzaK1DMc3ftunYpsb7stFo8ziBhvCKO+1ZIDr7v0m7S4Mk7zJ/ZavDckEhH3kWaG6q3M9YUH5mXFbst4DVwWtkKavktw1Dh4htody1uGjmlqJjaZSaFp3MvYgYVC05xxJfLuyFk8tGzUUQr7GQNYUJsdAz70LyXcXI5rDWuuen8scasYh1CF0mWK8m9PPTmkOoQZ2UQC47RdWFf7cbQcWNku/xnwVbwEzL0rth+Z/cvCNoto+LYpJS8WjgqTYo15JsZ8MidUaTbdUGKCA79FpYeMCSQC0poTijuOq6TKnEBzvnD6v7PM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(39840400004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(42186006)(316002)(41300700001)(2616005)(53546011)(966005)(36756003)(478600001)(38100700002)(86362001)(31696002)(83380400001)(66476007)(66946007)(66556008)(110136005)(30864003)(2906002)(31686004)(8936002)(4326008)(8676002)(5660300002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a05PVjZhVDNncTNxY3R1aTlzMWk0R0l5bkNPS1RiUmdMYzUrV1ZSUHVuYmRH?=
 =?utf-8?B?SW5uWFgzTUdXQmxyMk9nMjhQS3BSZllHYlV2RGRVdnVCN2JkQkZQNkd0ai9N?=
 =?utf-8?B?eklLMk5xZk5NNzlXeUIvbTNudGx6cVkrT3pnZ1NaMGttdklxZkRyejJKQ2ph?=
 =?utf-8?B?OG9ERXoyQXJCcEZzR3ZYcTNGbzVCNWhyeWw4cjNFLzIxVWFSYlhCandNVi84?=
 =?utf-8?B?bUN4WUlxanNXOW9DYWg1cUNIV3lpV2lWa214N0pmWDBqcGZiS2tSYW02elJQ?=
 =?utf-8?B?aEdKNWFyOWcrUHhmUkh4cTJwK3B0M01VZ25rbFBXWUtXbVZRdW9ZeWZnQ1hK?=
 =?utf-8?B?TmxYbnlFN3RwSDVOc3Q2VmxTbzdmVzVmWEdmZGwvcWNySVBYMVhVblpDeXI4?=
 =?utf-8?B?Zno4RHJ0Ym1wb2pwNXRvcjRmcXUxVkd5SFg1K0ZoMmdqZ2tSVll1aDdOY3I2?=
 =?utf-8?B?a0wvMnprSmcraml3WWpTS0xKSzBVdWNTdU04bkhkd01OTGhCSUNyTGtJZTlM?=
 =?utf-8?B?eE1haVJuVEZnMlVIQmVmb3o2UFgxMWs2R2NIYUI4a1FBdE1RZXY3NmpxTmwr?=
 =?utf-8?B?eUFkS2swMjV1TDRHV0pBcnZKRURWdkZRZytJQSt6YisxV1NWRW0yK0xaVHBU?=
 =?utf-8?B?cjAxWk1CNHdYekZ3dHBEQzJNVk14MmNhWUIyOEpJSDFuVU9xcS9wOCtkUStM?=
 =?utf-8?B?Z1Buc0ZHMVN2TktIWlNkKzMzeG1rWVh0TzZmOWlpTE5iWlRQYk9uVlFYakNq?=
 =?utf-8?B?VjRsSkFMOE5GRU13QWxGWDZXSGtxdXRYNVNCK3B4eEI1L0c2UjR6aTNlU29P?=
 =?utf-8?B?WWl4TE90OGY2cFh5TFpOd2FNSWJ5bFk4Nzkya1JURGZIRC9jTmphREx1bkxM?=
 =?utf-8?B?TWcvZ1haU3pUdXltcTlPdU1OM25Wb2JPUHBTWlNPK0QvT0FwbFl3bDVQeENz?=
 =?utf-8?B?a3k2N3o5UHhSbUkvdHY2Y2IzTG9QWWdjK0t6cktCRDlCZjdsV1VIdVRuaEc2?=
 =?utf-8?B?d05lejhiRnVJVDRyR2JpVWFqTFRuZTB0MjJDaXowTnlTc0dTTmlhMDNnT2Ja?=
 =?utf-8?B?eHdPc1c5amJVazlRdjhlaU1QYnZscTM2V29GZlhGSWNnN1RlRDdFSnZGYSs4?=
 =?utf-8?B?bGxRMVpXcUZsZlRGc1oxOWNnNEM5RXBMbjMzL0NZaGNBRUExMTVrSG5XZ2pp?=
 =?utf-8?B?OUQxbGVxdkI4ZE1QOFg3RzB3NWREWUszbUo2Z0phQkowdHRDV3Y5T3FDMHo5?=
 =?utf-8?B?WmNPNnVmUGRPbzhMTmFLaFIramNGWHJ4WlZaMmFHbkVZWDA0OGQ2UjB1Y2hJ?=
 =?utf-8?B?UkRuUDI3ejdBV2pCRkQwNzdFWHVLL0k2TjBMMmZJVjcrSGs4YVVET2tKTVBz?=
 =?utf-8?B?WVhzWklvZHNrTnpXRVQwU0NNK0VSbFJpQlNWL1NDRVErbFYvVlc5MVhPWkU4?=
 =?utf-8?B?a3p1WGFkMnhoY0xFaUxmSUt3SEVVMEpzcC9OTW0xd2dNbm8vWlpGb0JVaEtF?=
 =?utf-8?B?dGlqSzBmbnQ1ckh2TDB6SWdJTGZBejB5NlJIc3ozalZCZ2ptY1cxTlhsNTBu?=
 =?utf-8?B?alc1a2dQckF5QzlBTHdndWxOQ2Y3YzdVZHRPMjk5TnUwWFBROEVQWDRxWjVV?=
 =?utf-8?B?alRhY0lia3NCTThzVDlrUm5vVXRRbStCNTNDaTljK28wQmNYVjlYWkpZT3Vq?=
 =?utf-8?B?aFBvTlVCdVJjSkVhN2wycUxHa2Y4YS81c2wzZW5KRkJHbmxWbjhSTnFyRUtM?=
 =?utf-8?B?eTd1ZTZjRzZRdlBHKzVROEMzWWZ6TTNqYzlVWWZ1YzRNMW9VU0pMYXYxalpk?=
 =?utf-8?B?Sk81OVhnWnFjalkzUzBtVEw4Tlh1TkMwNTVaUUN5SVVvazVKZ0N6LzJjL3pu?=
 =?utf-8?B?MTZHdmdvQUMwSENIZlI5V3NyVDlPcG56Y0FwWGZIQ290VTY3Zzh1c3lKcVFr?=
 =?utf-8?B?UDlwald3VWkrLzhrRTJHeTI0dGRuMUozZTUvV3YvNEpsWTZhSkZPZkxOZWs0?=
 =?utf-8?B?bHpnSFVIc3ZkaFNqemM5Zk50QTZ1Q2RBclkrRTZGZ2JBSzh3UUV0LzBJS0pY?=
 =?utf-8?B?TkJEY2lRUHBTMnRCU211bzdET2FMOXhDR1BWcEtXTnVROEV0Qm1veTBZdzZn?=
 =?utf-8?B?aUZ3Uno5Zm5SMlMyUm5CTk5WQ2RQN2M2cklSTFA4dmRXVHJLbWhNSGVuM1ZH?=
 =?utf-8?Q?YI/+u6EPpl/hs0KN/MQ5eGQolcLm6mig8roHBEdiVeWH?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7202ab75-01ff-4fa0-f226-08dbc11b55df
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 18:38:55.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnkQwuaukKV6cjqsWvH2+GJi456EqmMby386JOT/pY7Et89J4F42xDje8Bx1E9X3x2buxA+C5uWTcNeclLBn/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2225
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27906.001
X-TMASE-Result: 10--29.618400-4.000000
X-TMASE-MatchedRID: jFqw+1pFnMz5ETspAEX/non73EnA6dC3lR7tN56aWVXUQNUFOKxy3gln
	xsqTOcV2UkCq2FJkF1wb25mb1JUxQiFEp5I9ctGM+ihdEtc5LWf8AJnZqRni93a33N5pgNLP9NF
	KrIIXgXzTyrg8xRsA+LjEJG2iwppOzuel2qVsWJH8VxSaKbmI7AVGwx2b8My2LoBQUMvufAVLXW
	tHC6NjSIWwvsw599iM4wkstvfL7OJ1x6jqjJqDtfHn6ZcQIyrXJ5wm1On2ELO8CKgi4HhAkFxkl
	CC0eQZ2K4aUSPyPdzVgB608uAZHVxyI7klQw/sRqeJZzLE73IU614dUZQxn4BNjOrRs2JZO1ptD
	JNM03SRmvhnf75mEuWxCJWCFRFrsYVXYIUi46B82pBJAba9d+k08rDsQdRyerIL6RCELYOL9vky
	wqNi6zN82ky0P59bAQP28h+lSrxEVyZ0k05PgvHzRkrQz4xEZWkxarUapj2MNY08wMOTDmpIicB
	UzQRsy2OQDtkh4LSEKZ39Zlz+82/kEtEWR4iuFEPSTHBgcfv6B1fO2o4QGcJmQAeWl/u9n41j+2
	o0U8UE5/td/9cEqUrMhclpgQ4ZgLgfB4NjXp/nf2e6voWUFXjQjE0jEWDIVOEwvJg+UGW+30xxx
	93i+vh0IxLy/mTNCkxVlV2dEro/c4LYNaOaL9hbadjTjVCQ2R2Jlse8FMPPRDig+1bLp5EjE5Fb
	JIU5rNut61y7+g96vLhPO3PDE+FNy7t2NuE4rX+P69NfyVj3GCI8DPyXV+8pxXhG1mdffYIuyJy
	BX1fff4t/GegxARQKYO91x9H79cBEGTIfhgADFTQGAKRxj5No+48giqZwnEgg3cwDHl/1O85Jco
	T0w/WCMkDOCX51pJU0nG3tpe+CbCOivU2HrC0kVAPr0TXS8
X-TMASE-XGENCLOUD: ee0a916c-3b42-49f5-95dd-b7c2483876ed-0-0-200-0
X-TM-Deliver-Signature: 84C7961D6CCBB36952DE6B94347F1FA4
X-TM-Addin-Auth: SXG8/gn/eoPaKNxHsg3VEcxaiE8XqcpCW8ZrtgvWFBj9NzV1LIHNxso1CJ8
	0fx7u17YXFlSrl8DC/ELuP0OVRsvm+pgkSxZsn6bPBvhfm7DluA5b9HZvpHo7UhoHUvR614s2Ky
	r4n1OQyQ0aCN2iYr3h0XlLqUctJZcZ3b7w0rsmMfmW5RCj4FnIueMWTED1ndLl891Smq1ReyutB
	nyX9PZJMi18gSIcKufsDD48vs/Vksild5G+UCGX43JRy4ZrJQUgrTP5o8xIvVseAwHc4v/DM+4u
	mUkCX4CfnFUxapc=.mWJQP02gA5USgjFBsBLbOyZzzpfsGrh3ShQeZc7/lBKj1/49CO3Y8gkiCG
	siJCSdRBuoUwAdewaaX1EVv4i0UvoygKyvV3EQ5G9qvf2r6CD5bWdWn/PG8+CSAuHtYob8b9HAh
	DLB8ilw721guR0zlvNTLganYaWTwxdT5nqfV0W+wuPvlAjNuDofERGCW9M7rwSRIQLO6FnAyFDG
	MmPk48U7QsIMps/qBsN/1fBl09od7NrEdRO293xLazuUXJs7EY2PraJdV0zhl+ZkBEZY5jzawDW
	2WfYmWE/R2FI6xQ3FIOvyr4jAQtapzNrkI/LDehc7f7MrQ4PGcsxRQ+5llw==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 25.09.23 11:31, Parav Pandit wrote:
> Hi Peter,
> 

Hi Parav,

I'm sorry to be a bit late with my answer, since I only received your email
via the mailing list, which I do not check so often.

>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Wednesday, September 13, 2023 2:34 PM
> 
>>> Can you please explain how 64-bit better when the number of clocks per
>> device is not so much?
>>> Even with 256 or 64K clocks device wont care how the ids are issued.
>>
>> 64 bit width should address the potential future case where two clocks get hot-
>> plugged and hot-unplugged at a high rate. If the device hands out a new id each
>> time a clock is re-plugged, and if the driver suspends and resumes during this,
>> an 8 bit id could result in the driver interpreting ids wrongly.
>>
> In the proposed spec, in a given rtc device, total number of clocks are static at the device discovery time.
> Clock cannot be hotplug or unplugged dynamically.
> Did I understand right?

Yes. The 64 bit width was just to accommodate for potential future
extensions. This does not force the device to use effectively 64 bit wide
ids. I chose 64 bit over 8 bit because I did not expect that this would
become an issue.

> 
> If not, and if the clocks can be added/removed dynamically, if the clock id is not available, the device will wait to hotplug the new one, until the old one is removed.
> Does one need 64K clocks under single device?
> If so, can you please share some thoughts on example application that might find it useful?

The example scenario is the one which is quoted above: The device might not
know when the driver is suspended, and continuously hand out new ids (when
clocks are continuously re-plugged for some reason). If the driver later
resumes at the wrong moment, by chance the same id which was in use before
might now be assigned to another clock.

This and similar scenarios can be prevented by using 64 bit ids.

> 
>>>>> Both the modes are in use, hence we want to support #1 and #2 both
>>>>> without
>>>> duplicating the interfaces.
>>>>>
>>>>
>>>> What I wanted to refer to in my reply are the Linux kernel /dev/ptp*
>>>> interfaces, which are separate from the network device interfaces.
>>>>
>>> Sure. It can be.
>>> When the netdevice has the RTC features supports it will create /dev/ptp*
>> and /sys/class/net/netdev devices.
>>>
>>> All the plumbing that is done is for dual use.
>>> So command etc definitions is for dual use as I explained before.
>>> Those can be used for virtio-net device when it has in-built rtc.
>>>
>>> When there is only rtc device with its own device-type, same functionality
>> and commands are there.
>>> Driver will create only /dev/ptp* device.
>>>
>>> From SW point of view it is just matter of layering..
>>> Already done by more than 13+ industry devices..
>>
>> I think there was a misunderstanding. I was trying to say: When it is better to
>> show distinct devices to userspace, would it not also be better to show distinct
>> devices at the Virtio level?
>>
> If a rtc functionality is in the virtio-rtc only device, it will be as virtio-rtc device.
> If the net device has embedded this functionality, the user will still see a distinct device at the OS level.
> Every OS would create OS level device object to operate on for the underlying hw device.
> So it will be fine to end user.
>  
> 

I agree that this is irrelevant for the end user.

>>> PCI transport resource improvement goes just beyond PCI transport
>> improvement. Such as APIC, IOMMU, device registers and more.
>>> This is equally an overkill.
>>
>> I understand it would be more effort. But to me it looks better as a generic
>> solution, which avoids imposing restrictions on the RTC device.
>>
> There are zero restrictions imposed on the RTC device because the spec is being drafted now.
> May be I didn’t convey the idea well.
> 
> The whole idea is the virtio-rtc can be independent device.
> A net-device can have the exact same functionality, so that virtio-rtc functionality can be embedded in it.
> Thereby, both model co-exists.
>  

I understand. I am just still concerned about the dual use of the spec for
the reasons which I gave below.

>>> And defining and duplicating exact same commands in net is equally sub-
>> optimal, specially when we know its need for last several months.
>>>
>>> This is the right junction to reuse functionality on two device types without
>> duplication.
>>
>> In my opinion it would still be preferable to have one RTC device, and have the
>> RTC device cooperate with the net device where needed.
> I read your below comments for the opinion.
> More below.
> 
>>
>>>>>> E.g., the
>>>>>> RTC device should also get an alarm, with an associated eventq, in
>>>>>> the
>>>> future.
>>>>> Sure, it is ok. it will be optional when it is RTC device.
>>>>>
>>>>>> Also, I wonder if the driver implementation should then work both
>>>>>> as a standalone Virtio driver and as part of the net driver.
>>>>>>
>>>>> Driver layer will be fine. Linux stack evolved over last 3 years to
>>>>> support
>>>> multi-functionality device.
>>>>> A RTC/PTP driver will be a stand alone entity that works on
>>>>> underlying layered
>>>> way to issue read cmd, config etc.
>>>>>
>>>>
>>>> As per my above reply, I think it would be better to tackle the
>>>> problem at the PCI transport level, then there would be no impact on
>> individual device drivers.
>>>>
>>> There is no impact by better definition usable on two devices.
>>
>> My main concerns about sharing the spec with the net device are:
>>
>> - the RTC device would act as a guinea pig, since no other devices share
>>   device-specific requirements so far
>>
> He he. No it should not. It is only matter of defining cmd opcode and status values that do not overlap one time.
>  

I don't know how spec sharing would be judged by the TC. At the moment, no
other devices do this.

>> - a more complex spec impacting two devices
>>
> Well it is the functionality, so once you look for slightly larger use cases, overall it is still less complexity than writing two different specs, one for net and one for rtc only device.
> 

Complexity-wise it would be best to have one RTC spec, and link the RTC
device to other devices through UUID if needed.

>> - strong coupling between net and RTC driver implementation (or code
>>   duplication)
>>
> Mostly no. it is the software layer. RTC layer operates over control VQ.
> So net device will provide the needed API. Same API would be available for dedicated rtc device lower layer too.
> No problem.
>  

But Virtio API will usually be time-proven, while drivers certainly have
opportunities to get the custom API wrong. 

>> - using custom interfaces (between net and RTC driver), rather than generic
>>   interfaces
>>
> Multi function devices are common in nature for functionality and scale.
> And OSes supports it already.
> 

Cf. above reply.

>> - RTC could not use device configuration
>>
> In your proposal all things are over cvq already.
> 

But it would prevent future use of the device configuration.

>> - unrecognized issues, or future generic changes to the Virtio standard,
>>   may inhibit future development of the RTC device or the net device
>>
> Unlikely as the reviews eliminate such issues.
>  
>> - unclear responsibility and timeline for net device related spec and
>>   proof-of-concept
>>
> All the responsible people of the technical committee are here.
> In fact the requirements are more closely tracked by its stake owners for net compared to other devices.
> So if you need help to find net side owner, let me know. Others and I are interested to have it in the net side.
> 

With "unclear responsibility" I meant to refer to the responsibility for
drafting a spec extension for virtio-net, and for creating a
proof-of-concept implementation for the virtio-net extension. As I wrote in
my previous email:

> I would prefer to first try to upstream the RTC spec without altering the
> net spec, while trying to avoid conflicts with the net spec. Maybe most of
> the RTC spec could then, as a second step, also be applied to the net
> device. The responsibility for this second step and the related proof of
> concept work would need to be clarified. To me it still seems better to not
> share the spec and address resource problems at the transport level.

>>>>>> Maybe the above use case could also be addressed by a standalone
>>>>>> RTC device as follows:
>>>>>>
>>>>>> 1) The net device exports a UUID object to which the RTC device
>>>>>> can refer to (so the drivers can link the net device to the RTC clock).
>>>>>>
>>>>>> 2) If needed, the RTC device aligns the lifetime of the clock to the net
>> device.
>>>>>> Then, clock lifetimes are no longer static, and can be aligned
>>>>>> with the net device. Through an eventq (to be added), the RTC
>>>>>> device announces clock creation/destruction, which can be
>>>>>> synchronized to the net
>>>> device state.
>>>>>>
>>>>> All of the infrastructure, cross device synchronization, its device
>>>>> side
>>>> management will come with equal complexity.
>>>>> And we will end up with sub-optimal way to using multiple PCI devices.
>>>>>
>>>>
>>>> As per my above reply, I think it would be better to tackle the
>>>> problem at the PCI transport level...
>>>>
>>>>> Net already has cvq required by RTC. So cvq commands can be common.
>>>>> Readq is additional, we need to define common between the two and
>>>>> way to
>>>> discover it.
>>>>>
>>>>
>>>>  I would still try to avoid mixing net and RTC details. RTC should
>>>> keep a dedicated cvq.
>>> Can you please explain why a dedicate cvq is needed on net device?
>>
>> I think the concern about redundant queues could be addressed by merging the
>> RTC readq and controlq. At the moment separating these queues would not
>> yield performance benefits, so I think I will just merge the readq and controlq
>> RTC queues in the next spec iteration.
>>
> Nice. Ok. lets have single cvq and related opcode range for RTC device and we will place them in the net side too.
> 

OK. In the net device, this queue should still be distinct from the net
controlq, which has a less predictable usage pattern than RTC control
requests.

>> As to why keeping the net and RTC queues separated: With a dedicated queue,
>> the RTC driver message processing could remain decoupled from the net driver.
>> Also, the net cvq format does not align well with the RTC messages.
>> RTC messages have detailed status codes, while net only has VIRTIO_NET_OK
>> and VIRTIO_NET_ERR.
>>
> We can extend the virtio net code too. If they are generic, it is likely that net will also find it useful.
> 
>>>> Then the RTC driver could use generic Virtio functionality to
>>>> send/receive rather than using an interface which is specific to the
>>>> net driver cvq.
>>>>
>>> Please explain why?
>>> We have dedicated vqs work ongoing for flow filters due to high rate of
>> requests requirement handled by hw.
>>>
>>> So would like to understand if we can extend similar dedicated cvq. Given
>> most of the queries done via cvq for rts are not time sensitive.
>>> Hence net cvq seems enough.
>>
>> This should have been addressed by merging the RTC readq and controlq, as per
>> my above reply.
>>
> Ok.
>  
>>>>>> Actually, the cross-timestamping support can be specific to the
>>>>>> combination of clock and hardware counter. This is explained in
>>>>>> more detail in the context of VIRTIO_RTC_M_READ_CROSS. I will
>>>>>> mention this
>>>> here as well.
>>>>>>
>>>>> Hardware counter is a misleading term here. It is really platform
>>>>> (system)
>>>> specific identifier.
>>>>>
>>>>
>>>> Maybe with the currently defined hardware counters there is a
>>>> one-to-one correspondence to platforms, but that need not be the
>>>> case. E.g. it might be more convenient for a device on an Intel x86
>>>> platform to read the Always Running Timer (ART) rather than the TSC
>>>> derived from the ART, and then the ART could become another HW counter
>> in the spec for x86.
>>>>
>>> Maybe I am wrong, but it looks like this is platform feature where driver can
>> device to read ART or ARM timer without any device knowledge?
>>
>> Not sure what is meant by "driver can device".
>>
> I meant to say that driver can read the clock from the system clock and device clock.
> At that point, cross timestamping convergence point is driver (and not device).
> Would that be sufficient?
> This way cross timestamping a driver level is still less accurate, but abstracted from the underlying system.
> 
> Or such level of accuracy is insufficient?
> 

Depends on the use case. Also, the driver-side cross-timestamping
performance will then depend a lot on the Virtio latency (while the
device-side cross-timestamping is very robust to Virtio latency).

The driver-side cross-timestamping can already be done now using
VIRTIO_RTC_M_READ. Arguably ioctl PTP_SYS_OFFSET_EXTENDED does such
cross-timestamping already with the current Linux kernel RFC driver [1], as
I described in an earlier email in this thread:

> The Linux kernel has ioctl PTP_SYS_OFFSET_EXTENDED, which will read the
> system time immediately before and after each PTP clock reading, leaving
> it up to userspace how to interpret the clock reading. This ioctl can
> also be used with the RFC Linux kernel driver implementing this spec
> [...]

But I think from the POV of the spec the driver-side cross-timestamping
would then be behavior internal to the driver, so does not need to be
discussed in the spec. In this case, Virtio only passes the device clock
reading via VIRTIO_RTC_M_READ.

Thank you for your comments,

Peter

[1] https://lore.kernel.org/all/20230818012014.212155-1-peter.hilber@opensynergy.com/T/#t

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

