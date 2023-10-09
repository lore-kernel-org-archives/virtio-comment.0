Return-Path: <virtio-comment-return-7633-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D312EE95A91
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 14:30:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1A6947C3CB
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 14:30:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EDEB1986546
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 14:30:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D8D5B9864D3; Mon,  9 Oct 2023 14:30:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C94F99864F0
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 14:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAdOI6lv96qq0tIhhPjOrKNUrfLbChft+SPAcBOiBJ5ZHbWehvu/jOqvUYsJBRXbjH5DikfytExmQmCTjHZFaLa2fP7OYepTWuzRsIgmfkbe6+t7n6pmERTUr+3KniMHTPaWelJ/Zm9ICEH09IZ0Hxuo/cgYIyZELK4ROGrhersb56wQuFSIymUsQu6pliPArqqMDH3YidiiIU76r6svon2+zB5LSvVawd6TgLly9ggkPqNwwwRDa/YoeTmdimppjRtJh0WVzg5xQo+yPoSGhgfCLxZdVEy0Rhznuk7uWwBsNenMs6xe5YhuqcWsSbvW/7ls0gfCLfmRcYXy/NI3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSlChEEroiWy4K2TNHzXM/TYb9Y+X/l8DsDijd66Tno=;
 b=A6vd8Nk0O0qNii2JowTxJTijoLS1YKdx7eNKNfQy2eyi6ayCWFOrByvFk5e4Id+ak+gDx97JTo+AKkxUAHSx+E+RyQYjgC9dZNArNwENaXBxqU3mo8fEwJ4hEl86mePnLFeTHUp6+g5F4SB7bLMbW3IfmzgDZGTQPd7SYPHhNgg8zy49TJWabTDXbj0KU7gbc674HUBqANqYSpegDRO1SNu9Z3Yl/u2ppSD45gDb2opFA5ltlGQclp48V3mB0yO9/ezC3QU28McUHZEtnPf30aHR+BQm8i0ZtCBwZxjCArK2aSo8/zt/IYSqLx3lIjPB06s5sFe3XqOEjz6elytbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index: AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4A==
Date: Mon, 9 Oct 2023 14:30:17 +0000
Message-ID:
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
In-Reply-To: <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|SA0PR12MB7002:EE_
x-ms-office365-filtering-correlation-id: 3f765787-edfa-448f-cb69-08dbc8d44226
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5lxpDDy9c43rnM5/FJ/rwCA1vAuOuCyWLG034koG8g7FFWPc+ZXKDDgGocgeLD9OC/wFuutObGvd8zbgfh8w8VFimVlfO3hov+Zc8tJ5lYVT+igTzBp3MSxoh5lzQgd3bb4nq1nFPENYv3M0X5sBvNypimh1xOTPy7sTK25E5GfL0N7olq/pkyYVQVy6jggJPW9HUEjf4kMpubs5o29NihDt7O71xy2kaPnm+1dZJ9N7z2L+39N8n6B62YVPfE++jaANKThGWWOCfz9xRjihSjwoEWw89KCxaBkV4WM+hJtQKE+j0wnueS8YIe5O+FRAUIwPPy1/43y6b9rY86Q9AID0IrcBAKpvd8U+moMqdNlHRV8BzU4Vu8RBuuYIlBOVeV7/I73/Z/+N/1zY6lQ3jXLu41huKWIpK3bqL6a6rJwy2F+39oE4jOgqkfacdB2fSF9uGxbkiuuU34YLyZp0WUl6+uJW2U3HtHHikC0NnipEfyQXqJvU/39LeZIqMKPFYSMp8D96hJrPKekWUa0AkqmkKGyeo6Q1vIReUx6vfopEnz3PVpN3tnm2yIETqSwq5ampitJJSpKnx2E9HchnsEiTmwMhEl+uApz9slPGi2oSmKdMT4vqKRh6+BuoxkCJr2il9EVDomjDks+xaBqqiUE4XfcZLcxMAP0ijepEzrw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(33656002)(38070700005)(38100700002)(86362001)(55016003)(9686003)(110136005)(966005)(2906002)(7696005)(6506007)(71200400001)(5660300002)(107886003)(478600001)(8676002)(66556008)(64756008)(54906003)(66946007)(66476007)(66446008)(41300700001)(316002)(76116006)(53546011)(83380400001)(4326008)(52536014)(8936002)(26005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUprWldVVXRrMURUdmZmcDI4NnUzbHVHSXozZjFTaTNBMUk4NFMxWjBJbkpi?=
 =?utf-8?B?QUhLNTRha0RxMmlPckJOT0FBK0RaQXJibngzQUZYcUc0dlFhTGVrOGhVYkhW?=
 =?utf-8?B?SHR1VGxHYlYyL0RENUhCM3hSWXJuV0hFVy8wcXQ0Zm5XU3E5V1pPcnVHL0g3?=
 =?utf-8?B?V1N6VjVQZVFTOEhDMEZ4WU5xSDF4MTZwdklia3I0Q01veFF4WjlHTVBLRTFU?=
 =?utf-8?B?SVh4aXJ4MDZGcXQ3MmszVThwbkI0eU1EZVVnSWRuTk80NHNjV1YxZTRoUCtp?=
 =?utf-8?B?eTVYMTIyRDNmY1NTWXdRbENqWEF2OXZmWElnV0E0OWtQSkM1VXF1NkdHZFFt?=
 =?utf-8?B?ejd6V3Ryc2lhVWJaaG5MWU5KRjJqSjY2aU5vc2xKWmtla0RzcnQvNXF1S1ky?=
 =?utf-8?B?OUYzekpIa0FaMldLSitsMnh1TkllQjh4aVJoejZ2MUh0dHdGa1BqcWFnQUk1?=
 =?utf-8?B?cDdPQ04rd1FSNDB2blZVUHpNaUF4S05DVW5hbzVERHJtc2JITHNEQ1JoNktk?=
 =?utf-8?B?SGI2c2RIR1Fad1BZc0dHYjhwYnNZQTdnQ2N2TGRwTFYrUlR2NVgyMktvV21Y?=
 =?utf-8?B?QW4vZ1g2Slh5L0VQSEE4M0xZa1NVMWxEK04xNCtDOHhLTkt2cW5qeWVrb3Qv?=
 =?utf-8?B?cXdlMTd5dWJtRnlLaFZpSWZyUis5cWFXS3JUMk5YY00xN0w0RGFpS0pvUXJZ?=
 =?utf-8?B?OFhPMloyMEVDWGVpRFUraGJ1L2psbFhwTGxkdXdXb2pFZkxSTk9vcE56Nlo3?=
 =?utf-8?B?am5oNEgzWi9qaEdiTG9GZmdtZjVhNWNzQ1JsOWZrZkExcldCWVBoYWlCZWZj?=
 =?utf-8?B?ZGxIMXA0M2UvN0ppVXhoeVJzMlNhYWU2TGg3VnE2MDJ1eUZYbFJwN203SThu?=
 =?utf-8?B?cnZJVTlYR1lTbm5uU0J0bmtMbGRoUmtqNFY2azB5SGoxQy9LZXlqTlkyS1RC?=
 =?utf-8?B?VVErNXNmbXpmNTNuVWRGc1d3NUhNWEp3anlpWE13SXdaM2x6RWtPTzlUSjRH?=
 =?utf-8?B?M24yay9YZ01xK0RpT3RjSGtrMFZ1V0NITGZRcWgrd0t1OWdqRVZyb1JJb1c1?=
 =?utf-8?B?R1hJTkd4NitVY0ZvOHVjbkxoQllxVWpYN0daOGdQdjh6MGtEMkJ5VzFJbzZE?=
 =?utf-8?B?VmNJbjhYOENUVWZpN1RZRGR6MFdjejJTNTdKRjUzL3AzMHRicWduQTdTUFNM?=
 =?utf-8?B?OVBoS2kxSGVFNk1UUjVVdFRlMFRSV0tzNHNNaHpXckVmWmFnSGNKRjgyOW45?=
 =?utf-8?B?T0gxTTM1TVpmUWcvY2YxRlRVRloyaUs3R1BLUEh1ZkV4QmV5Vm8rQTdGRzB0?=
 =?utf-8?B?b0tiaHlXVWpROVpHOEdUOUdsb3N5Z2x1Q2VXVWNyckNVWm90VkNBdEQ5enlj?=
 =?utf-8?B?dlhIeHcxRzB1clZwVWk1YVgzbjlqOGR5eVh5NFg3QnpwSHpyN3dibHI1S0c2?=
 =?utf-8?B?MnpEZXRhWUwrTUJQUEsvT0p2N2s4eDdsQUdKTDJWL0hvM1o5Q2MxVHR6c05L?=
 =?utf-8?B?NUYyL0tuSW1JM3JoMWQzVTlWbE9tajIwSXpJYzNZMGlCaTZSSFlBaWpJZnRl?=
 =?utf-8?B?bkhwNWN2dWJ2T2l6NUIxTkdWMHJQN1BSOUlZMGFNZDB4R1VyMzlDczJFbTZN?=
 =?utf-8?B?azFkeDREaDM2UndJbCt4eXhuTVVlOFAvNE5aQlcveEphcHVObWszWXRnOGNM?=
 =?utf-8?B?d1Z1WWlEdW10akZ1c0J0UkZVaTVjOXIxb2dLVlAvUkUxWGV4SVZkUW9ReEZQ?=
 =?utf-8?B?VWZJSzF0MUNMalQvRi83Z3B4aDc1NUhxeld1UlZKaXRXdVlDR0JUOG15M0ZX?=
 =?utf-8?B?QTNETTNzWC93UXFDUEFnU05OenpTQTUrOHJVam5MTHhqQ091djhqc3NVTUhE?=
 =?utf-8?B?Mi9HRjhtY1Y1aHFvaGJGQ2JDQytwSFdFSEtwSUFzRHNHZkk4Umw1VzYxdzdP?=
 =?utf-8?B?a3ZCTmo0YmxSeHFYN0ZucEVXNHByMVZ4MGo4VEtDVU1vRTFWWEhleEZQYjk4?=
 =?utf-8?B?MnpPdHRDbG1nNmJPQ2RhL3l4RVZna0lWOUs1dHk4b2duekZBc3ZsQ0FwNFcx?=
 =?utf-8?B?dTIxcnVYbzVQNlA5RGI5MWVCSlNXZThjeWpWT0FqTjdQYlRENHRucnRJcHNW?=
 =?utf-8?Q?lI4Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f765787-edfa-448f-cb69-08dbc8d44226
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 14:30:17.1423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GdztzFBW6aaOeT7cW4kdGSX1DJWp/sn6AXpeR7cVU3h+xbNt5J5YW9rbRT/asGY/euE/oyhhssIs7SyZiJiZpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogTW9uZGF5LCBPY3RvYmVyIDksIDIwMjMgNDowNCBQTQ0KPiANCj4gT24gMTAvOC8yMDIzIDc6
NDEgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiBPbiBTdW4sIE9jdCAwOCwgMjAy
MyBhdCAwMjoyNTo1MFBNICswMzAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+IERlZmluZSB0
aGUgZGV2aWNlIGNvbnRleHQgYW5kIGl0cyBmaWVsZHMgZm9yIHB1cnBvc2Ugb2YgZGV2aWNlDQo+
ID4+IG1pZ3JhdGlvbi4gVGhlIGRldmljZSBjb250ZXh0IGlzIHJlYWQgYW5kIHdyaXR0ZW4gYnkg
dGhlIG93bmVyIGRyaXZlcg0KPiA+PiBvbiBzb3VyY2UgYW5kIGRlc3RpbmF0aW9uIGh5cGVydmlz
b3IgcmVzcGVjdGl2ZWx5Lg0KPiA+Pg0KPiA+PiBEZXZpY2UgY29udGV4dCBmaWVsZHMgd2lsbCBl
eHBlcmllbmNlIGEgcmFwaWQgZ3Jvd3RoIHBvc3QgdGhpcw0KPiA+PiBpbml0aWFsIHZlcnNpb24g
dG8gY292ZXIgbWFueSBkZXRhaWxzIG9mIHRoZSBkZXZpY2UuDQo+ID4+DQo+ID4+IEZpeGVzOiBo
dHRwczovL2dpdGh1Yi5jb20vb2FzaXMtdGNzL3ZpcnRpby1zcGVjL2lzc3Vlcy8xNzYNCj4gPj4g
U2lnbmVkLW9mZi1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBTYXRhbmFuZGEgQnVybGEgPHNidXJsYUBtYXJ2ZWxsLmNvbT4NCj4gPj4gLS0t
DQo+ID4+IGNoYW5nZWxvZzoNCj4gPj4gdjAtPnYxOg0KPiA+PiAtIGVucmljaCBkZXZpY2UgY29u
dGV4dCB0byBjb3ZlciBmZWF0dXJlIGJpdHMsIGRldmljZSBjb25maWd1cmF0aW9uDQo+ID4+ICAg
IGZpZWxkcw0KPiA+PiAtIGNvcnJlY3RlZCBhbGlnbm1lbnQgb2YgZGV2aWNlIGNvbnRleHQgZmll
bGRzDQo+ID4+IC0tLQ0KPiA+PiAgIGNvbnRlbnQudGV4ICAgICAgICB8ICAgMSArDQo+ID4+ICAg
ZGV2aWNlLWNvbnRleHQudGV4IHwgMTQyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQzIGluc2VydGlvbnMo
KykNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZGV2aWNlLWNvbnRleHQudGV4DQo+ID4+DQo+
ID4+IGRpZmYgLS1naXQgYS9jb250ZW50LnRleCBiL2NvbnRlbnQudGV4IGluZGV4IDBhNjJkY2Uu
LjI2OTg5MzEgMTAwNjQ0DQo+ID4+IC0tLSBhL2NvbnRlbnQudGV4DQo+ID4+ICsrKyBiL2NvbnRl
bnQudGV4DQo+ID4+IEBAIC01MDMsNiArNTAzLDcgQEAgXHNlY3Rpb257RXhwb3J0aW5nIE9iamVj
dHN9XGxhYmVse3NlYzpCYXNpYyBGYWNpbGl0aWVzDQo+IG9mIGEgVmlydGlvIERldmljZSAvIEV4
cG8NCj4gPj4gICBVVUlEcyBhcyBzcGVjaWZpZWQgYnkgXGh5cGVycmVmW2ludHJvOnJmYzQxMjJd
e1tSRkM0MTIyXX0uDQo+ID4+DQo+ID4+ICAgXGlucHV0e2FkbWluLnRleH0NCj4gPj4gK1xpbnB1
dHtkZXZpY2UtY29udGV4dC50ZXh9DQo+ID4+DQo+ID4+ICAgXGNoYXB0ZXJ7R2VuZXJhbCBJbml0
aWFsaXphdGlvbiBBbmQgRGV2aWNlDQo+ID4+IE9wZXJhdGlvbn1cbGFiZWx7c2VjOkdlbmVyYWwg
SW5pdGlhbGl6YXRpb24gQW5kIERldmljZSBPcGVyYXRpb259DQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS9kZXZpY2UtY29udGV4dC50ZXggYi9kZXZpY2UtY29udGV4dC50ZXggbmV3IGZpbGUgbW9k
ZQ0KPiA+PiAxMDA2NDQgaW5kZXggMDAwMDAwMC4uNTYxMTM4Mg0KPiA+PiAtLS0gL2Rldi9udWxs
DQo+ID4+ICsrKyBiL2RldmljZS1jb250ZXh0LnRleA0KPiA+PiBAQCAtMCwwICsxLDE0MiBAQA0K
PiA+PiArXHNlY3Rpb257RGV2aWNlIENvbnRleHR9XGxhYmVse3NlYzpCYXNpYyBGYWNpbGl0aWVz
IG9mIGEgVmlydGlvDQo+ID4+ICtEZXZpY2UgLyBEZXZpY2UgQ29udGV4dH0NCj4gPj4gKw0KPiA+
PiArVGhlIGRldmljZSBjb250ZXh0IGhvbGRzIHRoZSBpbmZvcm1hdGlvbiB0aGF0IGEgb3duZXIg
ZHJpdmVyIGNhbiB1c2UNCj4gPj4gK3RvIHNldHVwIGEgbWVtYmVyIGRldmljZSBhbmQgcmVzdW1l
IGl0cyBvcGVyYXRpb24uIFRoZSBkZXZpY2UNCj4gPj4gK2NvbnRleHQgb2YgYSBtZW1iZXIgZGV2
aWNlIGlzIHJlYWQgb3Igd3JpdHRlbiBieSB0aGUgb3duZXIgZHJpdmVyDQo+ID4+ICt1c2luZyBh
ZG1pbmlzdHJhdGlvbiBjb21tYW5kcy4NCj4gPj4gKw0KPiA+PiArXGJlZ2lue2xzdGxpc3Rpbmd9
DQo+ID4+ICtzdHJ1Y3QgdmlydGlvX2Rldl9jdHhfZmllbGRfdGx2IHsNCj4gPj4gKyAgICAgICAg
bGUzMiB0eXBlOw0KPiA+PiArICAgICAgICBsZTMyIHJlc2VydmVkOw0KPiA+PiArICAgICAgICBs
ZTY0IGxlbmd0aDsNCj4gPj4gKyAgICAgICAgdTggdmFsdWVbXTsNCj4gPj4gK307DQo+ID4+ICsN
Cj4gPj4gK3N0cnVjdCB2aXJ0aW9fZGV2X2N0eCB7DQo+ID4+ICsgICAgICAgIGxlMzIgZmllbGRf
Y291bnQ7DQo+ID4+ICsgICAgICAgIHN0cnVjdCB2aXJ0aW9fZGV2X2N0eF9maWVsZF90bHYgZmll
bGRzW107IH07DQo+ID4+ICsNCj4gPj4gK1xlbmR7bHN0bGlzdGluZ30NCj4gc28gdGhpcyBzdGls
bCBkb2Vzbid0IHdvcmsgZm9yIG5lc3RlZA0KDQpJbiBvbmUgdXNlIGNhc2Ugb2YgbmVzdGluZywg
dGhhdCB3ZSBjYW1lIGFjcm9zcyBpczoNCnRoZXJlIGlzIGxhcmdlIGhvc3RfVk0gd2hpY2ggaXMg
aG9zdGluZyBhbm90aGVyIGd1ZXN0X1ZNcy4NCkluIHN1Y2ggY2FzZSwgdGhlIG93bmVyIFBGIGlz
IHBhc3N0aHJvdWdoIHRvIHRoaXMgaG9zdF9WTSBhbmQgY3VycmVudCBwcm9wb3NlZCBzY2hlbWUg
Y29udGludWUgdG8gZnVuY3Rpb24gZm9yIG5lc3RpbmcgYXMgd2VsbCBmb3IgbmVzdGVkIGd1ZXN0
X1ZNcy4NCg0KSW4gc2Vjb25kIHVzZSBjYXNlLCB3aGVyZSBvbmUgd2FudCB0byBiaW5kIG9ubHkg
b25lIG1lbWJlciBkZXZpY2UgdG8gb25lIFZNLCANCkkgdGhpbmsgc2FtZSBwbHVtYmluZyBjYW4g
YmUgZXh0ZW5kZWQgdG8gaGF2ZSBhbm90aGVyIFZGLCB0byB0YWtlIHRoZSByb2xlIG9mIG1pZ3Jh
dGlvbiBkZXZpY2UgaW5zdGVhZCBvZiBvd25lciBkZXZpY2UuDQoNCkkgZG9u4oCZdCBzZWUgYSBn
b29kIHdheSB0byBwYXNzdGhyb3VnaCBhbmQgYWxzbyBkbyBpbi1iYW5kIG1pZ3JhdGlvbiB3aXRo
b3V0IGxvdCBvZiBkZXZpY2Ugc3BlY2lmaWMgdHJhcCBhbmQgZW11bGF0aW9uLg0KSSBhbHNvIGRv
buKAmXQga25vdyB0aGUgY3B1IHBlcmZvcm1hbmNlIG51bWJlcnMgd2l0aCAzIGxldmVscyBvZiBu
ZXN0ZWQgcGFnZSB0YWJsZSB0cmFuc2xhdGlvbiB3aGljaCB0byBteSB1bmRlcnN0YW5kaW5nIGNh
bm5vdCBiZSBhY2NlbGVyYXRlZCBieSB0aGUgY3VycmVudCBjcHUuDQpEbyB5b3Uga25vdyBob3cg
ZG9lcyBpdCB3b3JrIGZvciBJbnRlbCB4ODZfNjQ/DQpDYW4gaXQgZG8gPiAyIGxldmVsIG9mIG5l
c3RlZCBwYWdlIHRhYmxlcz8gSWYgbm8sIHdoYXQgaXMgdGhlIHBlcmYgY2hhcmFjdGVyaXN0aWNz
IHRvIGV4cGVjdD8NCg==

