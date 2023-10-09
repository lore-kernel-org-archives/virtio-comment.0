Return-Path: <virtio-comment-return-7623-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA808E95A8D
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 04:15:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2E4A92AD4B
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 04:15:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 282EB98650E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 04:15:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B7A99864AF; Mon,  9 Oct 2023 04:15:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0C1E99864CC
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 04:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcAdpnqI/T17mJelQ5QPyCdA38iQu2esYzBc0S0/jzmzp3D7vIJEzmDS18BNVm2YEyY/c6oXNpsrUD1ig0DTnkLi5xOqFA2oWMnuW7zikxHMuidDAIZ3fmdcNvjb1SahMU6CBe0dVx+o5AVwSJEEksdqqPLBFm7MSHRUyTsLFucBAGXc/JbnsJST0anoTKWzeZNHOQS1n66LQxQp3HK0hXaCUXBfhAjFPr1zFTo8ZepYI6uTP21GRsRPKXX0lk+3SYcZKOotZ9xgLbgHDkCZOlxyGQX5K/G/hJS23Io2zl3m+My9JnlQy8Z4wsVWru00K+pv0SeutKGL2VWJkyWbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3BtO+clSLPZu5xHnGeY76uX0QOQkZFyntPC9NqrK+g=;
 b=IEaWjRnfQWvW4h7tAcW/97Gg/AzY6c4TPn9ZDLcMwSNFhsBWk04iMN553nE7v4xQmSipKZ7wYYFhR5v8hmtZisS89FFl6H0gH4AnkEmnY02pqKsq0U3oGQMFpPKXYTcGZbWntz2uyi5PSbOqWGEAJHCfJLqxk5lTne7eIub99J7x4qY41qCZo5WaX2mvwSt2X8GNhrESnEKuMyw2Kl61q4C+PL/1Rp/LKtA7pM9VQKEoJvqwJHZEGocLmBDRrq3IB0d0+hOH5GKRAJ3oKgZIE5R4D23GZWIZAM9TNVl0OufXHzC3WDxpUAZYw4dxBug8SVkNGm3utrrFV844HbNRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index: AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAEPRKA=
Date: Mon, 9 Oct 2023 04:15:01 +0000
Message-ID:
 <PH0PR12MB54810C93B29680EB7BBB41BCDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231008073912-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8518:EE_
x-ms-office365-filtering-correlation-id: ee326791-991e-41ee-cb41-08dbc87e4e91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MPbvCJCYIZy+kMYnYIuiwH9peLKyQ1SipByDFc9JXsvuBlpxptvafnyhx5onWGFmdUh/wkNh9QZZny60qdaOX19KYQDlFTZuXThaccA6Yv8EIaYDXYHKu29yZJU/gmZlp9Gedt6SRacOula6IM+xIvJrMn19n9RuKbi6u8WkDmGUE/pAi4Z95EhbwdMRTwlyGyFXxmOA+0y36KPlxIZD1rfcTQbavmtrp1/MjderijohAFwUsqAuiaEkMwEWENrLiOHuhFtYCrYEu3tyKNFzJWndwxcrAcWEskMZgxMbsrBFtKDaPfGF1+eMWxZH+YIvFHEVeUzuYjhojj4isVdlUkcSiqg/n2OGKAOUp/WBQQaETORwQNpw/TTow49tSmeKq5iOIOHjerSxVoyquAkOcnnVyKWOizfPQut5sLY7sbOqkfQK897YM5VIL6zIErI0XnWLUiCj+1QdFzCCAsvOAg7Uo1lgMiH+GyOFOv0iheIDUClnw9KTeR3fYNw1HjHhn8wJUplGYwpjgepEbxftZIM+kvZkMpGiQjG5Y7da62RSCkGYHj0Ak62MZl2yRLcXbdTNcX6iRM9B3qjCS+OMWQNXtfZkGWieawTfJyfN8CEWh8VkRVWJyMhS6c1kHN4B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6506007)(107886003)(7696005)(9686003)(55016003)(38070700005)(33656002)(86362001)(122000001)(38100700002)(26005)(2906002)(41300700001)(71200400001)(478600001)(8676002)(4326008)(52536014)(316002)(8936002)(5660300002)(76116006)(66476007)(66556008)(66446008)(64756008)(66946007)(6916009)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzJESXJhTHFza0ZjZ0szdDg3bnJhSll2cUdudlNnM2FtclpTU083WHM3ZG1D?=
 =?utf-8?B?eDdRMTU0UG84dm1XWE9jNW9xZnRVcXk3NjMvRXJCTnJEWmNUOEZuZnNPRFli?=
 =?utf-8?B?TmhnWktSYmdpdWJObEpmNmdKQS9kYmo3VXE4R3JXVy9KZndNeXBicVRPYjNy?=
 =?utf-8?B?eGtyakRIVExWSWNCVUpaK0JUQlFGbkF6dUlpL3FGVXdNdVBGT1JRM3hpd0E4?=
 =?utf-8?B?N2paQThFWEJlSzlUZy9tOFJVc3RuUnVhc2RmSFJCRlExVWpWUHhOeW42c0pS?=
 =?utf-8?B?cENDMHc4SWgrQS9lVGVTNUdvcFh3c1hvMlF5UkJYTGJsSzRoNFdUMmVwM2VZ?=
 =?utf-8?B?MWZwL2dXOTJ3ZkxrOFFXK3NENFlvam1yRlUrSmdGSVg2RlE1cWt3SXhEakdx?=
 =?utf-8?B?T3NETlE4cE1tMHUrSER5clBBV1Q5SU5tSjJVemM0bUNCWjFobmd1RzdabGlM?=
 =?utf-8?B?dUJwNC92TjZ6UjBtM2lxUWUrT3czRXVkMDZ3b29INHFCL0VjTWMxZnl2Uisz?=
 =?utf-8?B?ZmVEd0NVRmtZbW9CZzRBbVcwS0V5MWRBK29zaHV4MkFXdUJrTXQwM1VZTmtX?=
 =?utf-8?B?WTVTQlpNY0ZEVnJ4RzVhc24vcmJnZ3g4MTZKUG1vNFl4cVZVbUpNUzBtaWpU?=
 =?utf-8?B?dG9JdVZBdytlbnd4WncwbFI5Q0NIZE9wdHhnbjFta3dvWDdsaWd1YzNnQlNX?=
 =?utf-8?B?RWZuYmlVUzR1U3M1VzN2a3NUdFA0Z1hrS1NSME1qcnJ6MUQ4TEFYanhjUmFK?=
 =?utf-8?B?WGNmMkIxbVNnWU9oczEySnd4T3BQMzNja25zeWUyZjc4Qk94MkRYNnlMMjI3?=
 =?utf-8?B?eVdaN0dsSDFUMmFJSS84SWNXTGxnNHAvNm04cmFqMUg0SnYzTVVFUS9ML3Yx?=
 =?utf-8?B?SGxFa3MrL0R4OG5nVDBVMHplZ0VTVE1SMnVDRVZvV25JRUxRbUZBL09uZEZC?=
 =?utf-8?B?eVRJNlVaRUN0M3p0ZWtmZ0xvdkNZVzgwSEtHdngzNm9sdEN0MmMzbFlLMXBZ?=
 =?utf-8?B?blpBOEFGZU9LTVlsSExBVVNuMERNdVVFQ1BXMGEyeG8yM1BOa3NnbGw0ZTJF?=
 =?utf-8?B?RXZXdlN1UjJ0U04ydHR6YnRPeXNOR3hNeUlubjIyNlZyREpWbDUxelhpaXhF?=
 =?utf-8?B?cFg1VUdTZ1BUSlVNb2lWd3ZKRXgwM3lOTlliOTVZcWxlQ0JoOTJ2dnRyZ285?=
 =?utf-8?B?MmpUbks4S0tldkhtemc2UlB6cG9JZUlCRUdzdWEzTGhqQ29iT3lMMUlYU21L?=
 =?utf-8?B?bjJ4RWszZFFXU0FIVlBUbzdQd1BwM3lBdGNYYmlTOEpNU3NHc1I4UC9qOWI4?=
 =?utf-8?B?ZEZxY2ZjR1NqaVFIUEUyTUtwMnJ2SkFQczVaeGRZTnZyQ3Z0ZHUrL2Zubmxx?=
 =?utf-8?B?V2RlejdpWmxjZC9GdHU4dndBMk90cnp2WkFEMVgzdDFsV0NXZmtibk5qZExD?=
 =?utf-8?B?SFlMT09CbUVIcE5wZWwyaWRscmRYdEMyN1EwOVlBdTBnb2FDUWFJNDNJUGJR?=
 =?utf-8?B?MjNTdkdzN2FJZkEwT3cvc2xITW5Qa2ErOE1pbkUwSEVZdy9CejUvazl6MGNF?=
 =?utf-8?B?VFY1U1BmSjhXbVB3NWlKTERqTFRsUnU2NVFVcU10Wll2MGcrRjhqZGJMaHpU?=
 =?utf-8?B?M05mYXNmR3JOYTlJYks5VDhuT1NRUWV5L3NkQVA4eFJOeFNXS0wySmdPS3JW?=
 =?utf-8?B?RVcxVmpQYlZVcnNsQ3FDbEFPc0hEWHVHdC9oaDRubmtnNGFjWlJ1cWlxWURw?=
 =?utf-8?B?QkR0UFdGVHV1QVZuckhPemp1T3JGUllHVGoyMkF2a3FheWtJaTVBVXB3WkpO?=
 =?utf-8?B?SmtybDB3UlFLMzlOSHVMNDBMdVFaczJvdHd6YVAwMjNjcmdmcDBWLzc2a05x?=
 =?utf-8?B?N3J4c0xob3ZqRnAwUTNQc1J6SVpnQUFrY3dTU2pOdEJmWGRkdndmZURqVkFY?=
 =?utf-8?B?clJOVW5VNTh6Z0FzdExNUUdZYTdVSzdySlFvdFlWaHpvZFY1SFRINXE0aG54?=
 =?utf-8?B?SG1qeXlwOUpXMEV6RUptMGJGb3JTS3F2Lys1U3ZIRTFUWHBDRnppbmlGdEUv?=
 =?utf-8?B?cFpSOWlxSXRRNm9UeFFaSDFXeWlUSXlrSXFQSFYxYnp1Z0htamgrVDY5dnNI?=
 =?utf-8?Q?Y/Bk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee326791-991e-41ee-cb41-08dbc87e4e91
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 04:15:01.2446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Impma9fTPP4Z8i2Pzi+W2WLzroemVUyOOZEAq/HkHE2NfkGfoBm3W0zIE4ewb62Y/9gqMpmEREPXFw60JSQ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

SGkgTWljaGFlbCwNCg0KPiBGcm9tOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9y
ZyA8dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtDQo+IG9wZW4ub3JnPiBPbiBCZWhhbGYgT2Yg
TWljaGFlbCBTLiBUc2lya2luDQo+IFNlbnQ6IFN1bmRheSwgT2N0b2JlciA4LCAyMDIzIDU6MTIg
UE0NCg0KWy4uXQ0KPiA+ICtcYmVnaW57dGFidWxhcnh9e1x0ZXh0d2lkdGh9eyB8bHx8bHxYfCB9
IFxobGluZSB0eXBlICYgTmFtZSAmDQo+ID4gK0Rlc2NyaXB0aW9uIFxcIFxobGluZSBcaGxpbmUN
Cj4gPiArMHgwICYgVklSVElPX0RFVl9DVFhfUENJX0NPTU1PTl9SVU5USU1FX0NGRyAmIFByb3Zp
ZGVzIGNvbW1vbg0KPiA+ICtjb25maWd1cmF0aW9uIHNwYWNlIG9mIGRldmljZSBmb3IgUENJIHRy
YW5zcG9ydCBcXCBcaGxpbmUNCj4gPiArMHgxICYgVklSVElPX0RFVl9DVFhfREVWX0NGR19MQVlP
VVQgJiBQcm92aWRlcyBkZXZpY2Ugc3BlY2lmaWMNCj4gPiArY29uZmlndXJhdGlvbiBsYXlvdXQg
XFwgXGhsaW5lDQo+ID4gKzB4MiAmIFZJUlRJT19ERVZfQ1RYX0RFVl9GRUFUVVJFUyAmIFByb3Zp
ZGVzIGRldmljZSBmZWF0dXJlcyBcXA0KPiA+ICtcaGxpbmUNCj4gPiArMHgzICYgVklSVElPX0RF
Vl9DVFhfUENJX1ZRX0NGRyAmIFByb3ZpZGVzIFZpcnRxdWV1ZSBjb25maWd1cmF0aW9uDQo+ID4g
K2ZvciBQQ0kgdHJhbnNwb3J0IFxcIFxobGluZQ0KPiA+ICsweDQgJiBWSVJUSU9fREVWX0NUWF9W
UV9TUExJVF9SVU5USU1FX0NGRyAmIFByb3ZpZGVzIFF1ZXVlIHJ1bg0KPiB0aW1lDQo+ID4gK3N0
YXRlIFxcIFxobGluZQ0KPiA+ICsweDUgJiBWSVJUSU9fREVWX0NUWF9WUV9TUExJVF9ERVZfT1dO
X0RFU0MgJiBQcm92aWRlcyBsaXN0IG9mDQo+ID4gK3ZpcnRxdWV1ZSBkZXNjcmlwdG9ycyBvd25l
ZCBieSBkZXZpY2UgIFxcIFxobGluZQ0KPiA+ICsweDYgLSAweEZGRkZGRkZGICYgLSAmIFJlc2Vy
dmVkIGZvciBmdXR1cmUgdHlwZXMgXFwgXGhsaW5lDQo+ID4gK1xlbmR7dGFidWxhcnh9DQo+IA0K
PiANCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGVub3VnaCwgZS5nLiB2aXJ0aW8gbmV0IGhhcyBp
bnRlcm5hbCBzdGF0ZQ0KPiBjb250cm9sbGVkIHRob3VnaHQgQ1ZRIGNvbW1hbmRzLiBob3cgZG8g
eW91IGludGVuZCB0byBhZGRyZXNzL21pZ3JhdGUNCj4gdGhlc2U/DQo+DQpQb3N0IHRoaXMgc2Vy
aWVzLCB0aGUgMzItYml0IHR5cGUgZmllbGQgd2lsbCBiZSBzcGxpdCBpbnRvIHR3byByYW5nZXMu
DQpGaXJzdCByYW5nZSAoZXhpc3RpbmcpIHRvIGNvdmVyIGNvbW1vbiBjb250ZW50IGFjcm9zcyBh
bGwgZGV2aWNlIHR5cGUuDQpTZWNvbmQgcmFuZ2UgdG8gY29udGFpbiBkZXZpY2Ugc3BlY2lmaWMg
Y29udGVudCwgY29udGFpbmluZyBub24gaW50ZXJuYWwgZmllbGRzIHN1Y2ggYXMgZmllbGRzIHNl
dHVwIGJ5IHRoZSBndWVzdCBkaXJlY3RseSBvdmVyIENWUS4NCiANCj4gPiArXHN1YnN1YnNlY3Rp
b257RGV2aWNlIENvbnRleHQgRmllbGRzfVxsYWJlbHtzZWM6QmFzaWMgRmFjaWxpdGllcyBvZiBh
IFZpcnRpbw0KPiBEZXZpY2UgLyBEZXZpY2UgQ29udGV4dCAvIERldmljZSBDb250ZXh0IEZpZWxk
c30NCj4gPiArDQo+ID4gK1xwYXJhZ3JhcGh7UENJIENvbW1vbiBDb25maWd1cmF0aW9uIENvbnRl
eHR9DQo+ID4gK1xsYWJlbHtwYXI6QmFzaWMgRmFjaWxpdGllcyBvZiBhIFZpcnRpbyBEZXZpY2Ug
LyBEZXZpY2UgQ29udGV4dCAvIERldmljZSBDb250ZXh0DQo+IEZpZWxkcy8gUENJIENvbW1vbiBD
b25maWd1cmF0aW9uIENvbnRleHR9DQo+ID4gKw0KPiA+ICtGb3IgdGhlIGZpZWxkIFZJUlRJT19E
RVZfQ1RYX1BDSV9DT01NT05fUlVOVElNRV9DRkcsIFxmaWVsZHt0eXBlfQ0KPiBpcyBzZXQgdG8g
MHgwLg0KPiA+ICtUaGUgXGZpZWxke3ZhbHVlfSBpcyBpbiBmb3JtYXQgb2YgXGZpZWxke3N0cnVj
dCB2aXJ0aW9fcGNpX2NvbW1vbl9jZmd9Lg0KPiA+ICtUaGUgXGZpZWxke2xlbmd0aH0gaXMgdGhl
IGxlbmd0aCBvZiBcZmllbGR7c3RydWN0IHZpcnRpb19wY2lfY29tbW9uX2NmZ30uDQo+ID4gKw0K
PiA+ICtccGFyYWdyYXBoe0RldmljZSBDb25maWd1cmF0aW9uIExheW91dCBDb250ZXh0fQ0KPiA+
ICtcbGFiZWx7cGFyOkJhc2ljIEZhY2lsaXRpZXMgb2YgYSBWaXJ0aW8gRGV2aWNlIC8gRGV2aWNl
IENvbnRleHQgLyBEZXZpY2UgQ29udGV4dA0KPiBGaWVsZHMvIERldmljZSBDb25maWd1cmF0aW9u
IExheW91dCBDb250ZXh0fQ0KPiA+ICsNCj4gPiArRm9yIHRoZSBmaWVsZCBWSVJUSU9fREVWX0NU
WF9ERVZfQ0ZHX0xBWU9VVCwgXGZpZWxke3R5cGV9IGlzIHNldCB0byAweDEuDQo+ID4gK1RoZSBc
ZmllbGR7dmFsdWV9IGlzIGluIGZvcm1hdCBvZiBkZXZpY2Ugc3BlY2lmaWMgY29uZmlndXJhdGlv
biBsYXlvdXQgbGlzdGVkDQo+ID4gK2luIGVhY2ggb2YgdGhlIGRldmljZSdzIGRldmljZSBjb25m
aWd1cmF0aW9uIGxheW91dCBzZWN0aW9uLg0KPiA+ICtUaGUgXGZpZWxke2xlbmd0aH0gaXMgdGhl
IGxlbmd0aCBvZiB0aGUgZGV2aWNlIGNvbmZpZ3VyYXRpb24gbGF5b3V0IGRhdGEuDQo+IA0KPiBV
bmNsZWFyLiBJIGFtIGd1ZXNzaW5nIGl0J3MgZG9pbmcgdGhpbmdzIGxpa2Ugc2V0dGluZyB1cCBS
Tw0KPiBmaWVsZHM/IFRoaXMgbmVlZHMgdG8gYmUgc3BlY2lmaWVkIHBlciBkZXZpY2UgcmVhbGx5
Lg0KPiBBbHNvIGhvdyBzb21lIGZpZWxkcyBiZWhhdmUgbWlnaHQgZGVwZW5kIG9uIGZlYXR1cmVz
Lg0KSW4gcHJhY3RpY2UgZmllbGRzIGluIHRoaXMgYXJlYSBkbyBub3QgY2hhbmdlIGEgbG90LCBi
dXQgaXQgY2FuIGZvciBleGFtcGxlIHRoZSBsaW5rIHN0YXR1cy9zcGVlZCBvZiBuZXQgZGV2aWNl
Lg0KU28gaXQgaXMgbm90IFJPIHBlciBzYXkuDQoNClJlZ2FyZGluZyBpdCBiZSBkZXZpY2Ugc3Bl
Y2lmaWMgb3IganVzdCBhIGNvbmZpZ19sZW5ndGggYmxvYiwgSSB0aGluayBjb25maWdfbGVuZ3Ro
IGJsb2IgaXMganVzdCBmaW5lIGZvciBkZXZpY2VfY29udGV4dCB1c2UuDQpUaGlzIGlzIGJlY2F1
c2UgdGhlcmUgaXNu4oCZdCBhIG5lZWQgZm9yIG1pZ3JhdGlvbiBkcml2ZXIgdG8gcGFyc2UgYW55
IG9mIHRoZXNlIGZpZWxkcy4NCg==

